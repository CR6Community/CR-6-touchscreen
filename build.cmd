@echo off
powershell -NoProfile -File %~dp0\%~n0.ps1 -Arguments %*
exit /b %ERRORLEVEL%