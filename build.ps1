Write-Host "DGUS DWIN firmware build package script v1.0" -ForegroundColor Cyan
Write-Host ""
Write-Host "WARNING: " -ForegroundColor YellowWrite-Host "1 . Ensure you've clicked 'Generate' in the DWIN editor first" -ForegroundColor Yellow
Write-Host "2 . If any screens are updated, make sure you've re-generated the ICL file (see README.md)" -ForegroundColor Yellow
Write-Host "Press any key to confirm!" -ForegroundColor Yellow
Read-Host | Out-Null

$BuildDir = "build"

Remove-Item $BuildDir -Recurse -Force -ErrorAction SilentlyContinue
New-Item $BuildDir -ItemType Directory | Out-Null

$ProjectFolder = "src/DWIN"
$FirmwareFolderName = "DWIN_SET"
$OutputPath = "$BuildDir/CR-6-touchscreen-$(Get-Date -Format "yyyy-MM-dd").zip"
$ReadMeFilePath = "src/README.txt"
$ExampleSuccesfulFilePath = "src/flash_succesful.png"

$DWINFolder = Get-ChildItem -Path $ProjectFolder -Filter $FirmwareFolderName
$ReadMeFile = Get-Item -Path $ReadMeFilePath
$ExampleSuccesfulFile = Get-Item -Path $ExampleSuccesfulFilePath

@($DWINFolder, $ExampleSuccesfulFile, $ReadMeFile) | Compress-Archive -DestinationPath $OutputPath -CompressionLevel Optimal -Verbose
Write-Host ""
Write-Host "Done! Please find the archive in $OutputPath" -ForegroundColor Green
Read-Host | Out-Null