Write-Host "DGUS DWIN firmware build package script v1.0" -ForegroundColor Cyan
Write-Host ""
Write-Host "WARNING: " -ForegroundColor YellowWrite-Host "1 . Ensure you've clicked 'Generate' in the DWIN editor first" -ForegroundColor Yellow
Write-Host "2 . If any screens are updated, make sure you've re-generated the ICL file (see README.md)" -ForegroundColor Yellow
Write-Host "Press any key to confirm!" -ForegroundColor Yellow
Read-Host | Out-Null

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
$ExampleFailedFilePath = "src/flash_failed.jpg"

[array] $ZipInputs = $($ReadMeCopiedFilePath, $ExampleSuccesfulFilePath, $ExampleFailedFilePath)

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

# ... DWIN seems sensitive to these names?
Get-ChildItem -Path $BuildTmpDir -Recurse -Filter "13*.bin" | Rename-Item -NewName "13TouchFile.bin"
Get-ChildItem -Path $BuildTmpDir -Recurse -Filter "14*.bin" | Rename-Item -NewName "14ShowFile.bin"

# Make ZIP file
Write-Host "Zipping..." -ForegroundColor Cyan
[array] $ZipContents = $ZipInputs | Get-Item
$DWINFolder = Get-Item -Path "$BuildTmpDir/$FirmwareFolderName"
$ZipContents += $DWINFolder

$ZipContents | Compress-Archive -DestinationPath $OutputPath -CompressionLevel Optimal -Verbose

# Done
Write-Host ""
Write-Host "Done! Please find the archive in $OutputPath" -ForegroundColor Green

Read-Host | Out-Null