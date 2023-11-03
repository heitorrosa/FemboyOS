@ECHO OFF &SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
title "GamingOS | Initial Executor"
cd /D "%~dp0"

IF EXIST "C:\Windows\system32\adminrightstest" (
rmdir C:\Windows\system32\adminrightstest >NUL 2>&1
)
mkdir C:\Windows\system32\adminrightstest >NUL 2>&1
if %errorlevel% neq 0 (
POWERSHELL "Start-Process \"%~nx0\" -Verb RunAs"
if !errorlevel! neq 0 (
POWERSHELL "Start-Process '%~nx0' -Verb RunAs"
if !errorlevel! neq 0 (
ECHO You should run this script as Admin in order to allow system changes
pause
exit
)
)
exit
)

rmdir C:\Windows\system32\adminrightstest >NUL 2>&1

POWERSHELL $ProgressPreference-'SilentlyContinue' >NUL 2>&1
POWERSHELL Invoke-WebRequest -UseBasicParsing -Uri https://github.com/heitorrosa/gamingos-ltsc-2021/raw/main/Setup.bat -OutFile "C:\Windows\Temp\Setup.bat" >NUL 2>&1
POWERSHELL Invoke-WebRequest -UseBasicParsing -Uri https://github.com/heitorrosa/gamingos-ltsc-2021/raw/main/MinSudo.exe -OutFile "C:\Windows\Temp\minsudo.exe" >NUL 2>&1
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --System --Privileged C:\Windows\Temp\Setup.bat" >NUL 2>&1
