@echo off
pwsh -NoProfile -ExecutionPolicy Unrestricted -File %~dp0\%~n0.ps1 -Arguments %*
exit /b %ERRORLEVEL%