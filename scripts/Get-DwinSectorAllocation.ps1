[CmdletBinding()]
Param(
    [Parameter(Mandatory=$true)]
    [string]
    $FolderPath
)

# Parameter checking
if (!(Test-Path $FolderPath)) {
    Write-Error "Folder: $FolderPath does not exist"
    Exit -1
}

$DwinSetPath = Join-Path $FolderPath "DWIN_SET"

if (!(Test-Path $DwinSetPath)) {
    Write-Warning "Assuming '$FolderPath' is the DWIN_SET folder"
    $DwinSetPath = $FolderPath
}

$DwinSetPath = Resolve-Path $DwinSetPath

Write-Host "Checking files in path $DwinSetPath"

# Constants
$SectorCount = 64
$SectorSize = 256KB

# Plumbing
Class DwinFile {
    [string]$FileName
    [int]$FileId # ID
    [int]$FileSize # Bytes
    [bool]$HasError

    [int]GetSectorCount() {
        $Kbs = [double] $this.FileSize / $Script:SectorSize;
        return [Math]::Ceiling($Kbs);
    }
}

class Sector {
    [int] $SectorId # Zero-based
    [DwinFile[]] $Files = [DwinFile[]]::new(0) # Array of files 

    [bool]HasError() {
        return $this.Files.Length -gt 1;
    }

    [bool]IsEmpty() {
        return $this.Files.Length -eq 0;
    }
}

# Set-up sectors
[Sector[]]$Sectors = [Sector[]]::new($SectorCount)
for ($SectorId = 0; $SectorId -lt $Sectors.Length; $SectorId++) {
    $Sector = [Sector]::new()
    $Sector.SectorId = $SectorId
    $Sectors[$SectorId] = $Sector
}

# Set-up files
[System.IO.FileInfo[]]$Files = Get-ChildItem -Path $DwinSetPath | Where-Object -Property Name -Match -Value "^\d+(.*?)\.(ICL|HZK|BIN)$"

Write-Host "$($Files.Length) are flashable to the main flash space"

[DwinFile[]] $DwinFiles = [DwinFile[]]::new($Files.Length)

$DwinFileArrayIndex = 0;
[int]$LongestFileNameLength = 0
foreach ($File in $Files) {
    $DwinFile = [DwinFile]::new()
    $DwinFile.FileName = $File.Name
    $DwinFile.FileSize = [int] $File.Length
    
    # Parse file number
    if (!$($DwinFile.FileName -imatch "^(?<fileId>\d+)")) {
        Write-Error "Unable to parse file $($DwinFile.FileName)"
        Exit -1
    }

    $LongestFileNameLength = [Math]::Max($DwinFile.FileName.Length, $LongestFileNameLength)

    $DwinFile.FileId = [int] $Matches["fileId"]
    $DwinFiles[$DwinFileArrayIndex] = $DwinFile

    [Sector] $Sector = $Sectors[$DwinFile.FileId]
    if ($null -eq $Sector) {
        Write-Error "Dwin file $($DwinFile.FileName) is out of bounds"
        Exit -1
    }

    $StartSectorId = $DwinFile.FileId
    for ($SectorId = $StartSectorId; $SectorId -lt $($StartSectorId + $DwinFile.GetSectorCount()); $SectorId++) {
        try {
            [Sector]$Sector = $Sectors[$SectorId]
        } catch {
            Write-Error "Sector #$SectorId is not valid for file $($DwinFile.FileName)"
            Exit -1
        }

        $Sector.Files += @($DwinFile)
    }

    $DwinFileArrayIndex++
}

## Go over the files once more to determine error state
foreach ($DwinFile in $DwinFiles) {
    $StartSectorId = $DwinFile.FileId
    for ($SectorId = $StartSectorId; $SectorId -le $($StartSectorId + $DwinFile.GetSectorCount()); $SectorId++) {
        [Sector]$Sector = $Sectors[$SectorId]
        if ($Sector.HasError()) {
            $DwinFile.HasError = $true
        }
    }
}

# Write visualization

[int]$FilenameSpacing = $LongestFileNameLength + 2

function Write-Label([string]$Label, [switch]$HasError) {
    $Color = if ($HasError) { [ConsoleColor]::Red } else { [ConsoleColor]::Black }
    Write-Host $Label.PadRight($FilenameSpacing) -NoNewLine -BackgroundColor $Color  -ForegroundColor White
}

function Write-Sector([Switch]$HasError, [Switch]$Empty) {
    $Char = if ($Empty -eq $false) { '█' } else { '░' }
    $Color = if ($Empty -eq $true) { [ConsoleColor]::Gray } elseif ($HasError -eq $false) { [ConsoleColor]::Cyan } else { [ConsoleColor]::Red }

    Write-Host $Char -NoNewline -ForegroundColor $Color -BackgroundColor Black
}

function Write-LineSummary($Text, [Switch]$HasError) {
    $Color = if ($HasError -eq $false) { [ConsoleColor]::Cyan } else { [ConsoleColor]::Red }
    Write-Host " $Text" -ForegroundColor $Color
}

## Sector line
Write-Host ""
Write-Host $("Sector allocation overview".PadRight($FilenameSpacing + $Sectors.Length)) -BackgroundColor Blue -ForegroundColor Black -NoNewLine 
Write-Host ""
Write-Label "Sectors" 

$AllocatedSectorCount = 0
foreach ($Sector in $Sectors) {
    $HasError = $Sector.HasError()
    $IsEmpty = $Sector.IsEmpty()
    Write-Sector -HasError:$HasError -Empty:$IsEmpty

    if ($IsEmpty -eq $false) {
        $AllocatedSectorCount++
    }
}

Write-LineSummary "$AllocatedSectorCount / $($Sectors.Length) sectors allocated"

[DwinFile[]] $DwinFilesWithErrors = [DwinFile[]]::new(0)
foreach ($DwinFile in $DwinFiles) {
    Write-Label -Label $DwinFile.FileName -HasError:$DwinFile.HasError

    $StartSectorId = $DwinFile.FileId
    $EndSectorId = $StartSectorId + $DwinFile.GetSectorCount() - 1
    foreach ($Sector in $Sectors) {
        $IsEmpty = $Sector.SectorId -lt $StartSectorId -or $Sector.SectorId -gt $EndSectorId
        $HasError = $IsEmpty -eq $false -and $Sector.HasError()

        Write-Sector -HasError:$HasError -Empty:$IsEmpty
    }

    $FileSizeKb = $DwinFile.FileSize / 1KB
    $SectorsUsed = $DwinFile.GetSectorCount()
    $SectorSizeLeft = (($DwinFile.GetSectorCount() * $SectorSize) - $DwinFile.FileSize) / 1KB

    $Summary = "$([Math]::Round($FileSizeKb)) KB".PadRight(8)
    $Summary += " | $($SectorsUsed) sector used ($([Math]::Round($SectorSizeLeft)) KB left)"

    Write-LineSummary $Summary

    if ($DwinFile.HasError) {
        $DwinFilesWithErrors += @($DwinFile)
    }
}

Write-Host ""
if ($DwinFilesWithErrors.Length -eq 0) {
    Write-Host "No overlapping files have been detected" -ForegroundColor White -BackgroundColor Green -NoNewline
    Write-Host ""

    Exit 0
} else {
    Write-Host "The following files are overlapping:" -ForegroundColor White -BackgroundColor Red -NoNewline
    Write-Host ""
    
    foreach ($DwinFile in $DwinFilesWithErrors) {
        Write-Label -Label "$($DwinFile.FileName)" -HasError:$True
        Write-Host ""
    }

    Write-Host "Please move and reallocate these files to different sectors" -ForegroundColor White -BackgroundColor Red -NoNewline
    Write-Host ""

    Exit $($DwinFilesWithErrors.Length)
}