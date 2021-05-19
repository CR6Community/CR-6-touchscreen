Param([string]$Deploy, [Switch]$nozip)

Write-Host "DGUS DWIN firmware build package script v1.0" -ForegroundColor Cyan
Write-Host ""
Write-Host "WARNING: " -ForegroundColor Yellow
Write-Host "1 . Ensure you've clicked 'Generate' in the DWIN editor first" -ForegroundColor Yellow
Write-Host "2 . If any screens are updated, make sure you've re-generated the ICL file (see README.md)" -ForegroundColor Yellow

# Variables 
$BuildDir = "build"
$BuildTmpDir = "build\tmp"

$ProjectFolder = "src/DWIN"
$FirmwareFolderName = "DWIN_SET"

$OutputPath = "$BuildDir/CR-6-touchscreen-$(Get-Date -Format "yyyy-MM-dd").zip"

# ... ZIP inputs
$ReadMeFilePath = "src/README.md"
$ReadMeCopiedFilePath = "$BuildTmpDir/README.txt"
$ExampleSuccesfulFilePath = "src/flash_succesful.jpg"
$ExampleSuccesful2FilePath = "src/flash_succesful2.jpg"
$ExampleProgressFilePath = "src/flashing_in_progress.jpg"
$ExampleFailedFilePath = "src/flash_failed.jpg"
$ExampleFailed2FilePath = "src/flash_failed2.jpg"
$ExampleExplorerScreenshotFilePath = "src/dwin-folder-on-sd-card.png"

[array] $ZipInputs = $($ReadMeCopiedFilePath, $ExampleSuccesfulFilePath, $ExampleSuccesful2FilePath, $ExampleProgressFilePath, $ExampleExplorerScreenshotFilePath, $ExampleFailedFilePath, $ExampleFailed2FilePath)

# Clean up
Write-Host "Cleaning up..." -ForegroundColor Cyan
Remove-Item $BuildDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item $BuildDir -ItemType Directory | Out-Null
New-Item $BuildTmpDir -ItemType Directory | Out-Null

Copy-Item $ReadMeFilePath $ReadMeCopiedFilePath -Force -Verbose

# Copy DWIN stuff
Write-Host "Preparing..." -ForegroundColor Cyan

Copy-Item -Path "$ProjectFolder/$FirmwareFolderName" -Recurse -Destination $BuildTmpDir

# ... Bitmaps are now actually used
Get-ChildItem -Path $BuildTmpDir -Recurse -Filter "*.bmp" | Remove-Item -Force

# ... Child folders not relevant
Get-ChildItem -Path "$BuildTmpDir/$FirmwareFolderName" -Directory | Remove-Item -Force -Recurse

# ... DWIN seems sensitive to these names?
Get-ChildItem -Path $BuildTmpDir -Recurse -Filter "13*.bin" | Rename-Item -NewName "13_Touch.bin"
Get-ChildItem -Path $BuildTmpDir -Recurse -Filter "14*.bin" | Rename-Item -NewName "14_Variables.bin"

# ... Move kernel upgrades into their own folder-on-sd-card
$KernelUpgradePath = Join-Path -Path $BuildTmpDir -ChildPath "CR-6 kernel upgrade"
New-Item $KernelUpgradePath -ItemType Directory | Out-Null
Get-ChildItem -Path $BuildTmpDir -Recurse -Filter "T5L_*.bin" | Move-Item -Destination $KernelUpgradePath

# Check sector allocation
Write-Host "Checking sector allocation..." -ForegroundColor Cyan

Write-Host "---------------------------------------------------"
.\scripts\Get-DwinSectorAllocation.ps1 $BuildTmpDir
Write-Host "---------------------------------------------------"

if ($LASTEXITCODE -ne 0) {
    Write-Host "... sector allocation check failed" -ForegroundColor Red
    Exit -1
}

Write-Host "... sector allocation check successful" -ForegroundColor Green

if (! $nozip) {
# Make ZIP file
Write-Host "Zipping..." -ForegroundColor Cyan
[array] $ZipContents = $ZipInputs | Get-Item
$DWINFolder = Get-Item -Path "$BuildTmpDir/$FirmwareFolderName"
$ZipContents += $DWINFolder
$ZipContents += $(Get-Item -Path $KernelUpgradePath)
$ZipContents | Compress-Archive -DestinationPath $OutputPath -CompressionLevel Optimal -Verbose
}

if ($Deploy) {
	Remove-Item -Path $(Join-Path $Deploy "DWIN_SET") -Recurse -Force -Verbose -ErrorAction SilentlyContinue
	Copy-Item "$BuildTmpDir/$FirmwareFolderName" -Destination $Deploy -Verbose -Force -Recurse
}

# Done
Write-Host ""
Write-Host "Done! Please find the archive in $OutputPath" -ForegroundColor Green

Exit 0