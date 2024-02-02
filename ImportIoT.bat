@echo off
slmgr /ipk QPM6N-7J2WJ-P88HH-P3YRH-YY74H
slmgr /skms kms9.msguides.com
slmgr /ato
curl -g -k -L -# -o "C:\Windows\Temp\FemboyOS.bat" "https://github.com/heitorrosa/FemboyOS/raw/iotltsc/FemboyOS.bat" >NUL 2>&1
"C:\Windows\System32\minsudo.exe" --System --TrustedInstaller --Privileged "C:\Windows\Temp\FemboyOS.bat" >NUL 2>&1
