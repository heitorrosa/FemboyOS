@echo off
curl -g -k -L -# -o "C:\Windows\Temp\FemboyOS.bat" "https://github.com/heitorrosa/FemboyOS/raw/iotltsc/FemboyOS.bat" >NUL 2>&1 & powershell Start-Process -FilePath "minsudo.exe --System --TrustedInstaller --Privileged C:\Windows\Temp\FemboyOS.bat" >NUL 2>&1
