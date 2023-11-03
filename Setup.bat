@ECHO OFF &SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
title "GamingOS | System Setup"
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
POWERSHELL Set-ExecutionPolicy Unrestricted >NUL 2>&1
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f. >NUL 2>&1

:start
ECHO Installing Thorimum Browser...
POWERSHELL $ProgressPreference-'SilentlyContinue' >NUL 2>&1
POWERSHELL Invoke-WebRequest -UseBasicParsing -Uri https://github.com/Alex313031/Thorium-Win-AVX2/releases/latest/download/thorium_AVX2_mini_installer.exe -OutFile "C:\Windows\Temp\thorium.exe" >NUL 2>&1
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\thorium.exe" >NUL 2>&1

ECHO Uninstalling Microsoft Edge Browser...
POWERSHELL $ProgressPreference-'SilentlyContinue' >NUL 2>&1
POWERSHELL Invoke-WebRequest -UseBasicParsing -Uri https://github.com/heitorrosa/gamingos-ltsc-2021/raw/main/Remove-Edge.exe -OutFile "C:\Windows\Temp\remove-edge.exe" >NUL 2>&1
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --System --Privileged C:\Windows\Temp\remove-edge.exe" >NUL 2>&1

ECHO Installing OpenShell...
POWERSHELL $ProgressPreference-'SilentlyContinue' >NUL 2>&1
POWERSHELL Invoke-WebRequest -UseBasicParsing -Uri https://github.com/Open-Shell/Open-Shell-Menu/releases/download/v4.4.191/OpenShellSetup_4_4_191.exe -OutFile "C:\Windows\Temp\OpenShell.exe" >NUL 2>&1
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\OpenShell.exe" >NUL 2>&1
start https://cdn.discordapp.com/attachments/868975716035866624/1169724042341777439/image.png?ex=65567168&is=6543fc68&hm=bfa6f7e82df1c8d18a46cc467ccd53ffb4da16a1f6c03531a0acacd147a76297&
ECHO.
pause

ECHO "Applying Basic Tweaks & Configurations"
REM Turn off Application Telemetry
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Telemetry" /v AllowTelemetry /t REG_DWORD /d 0 /f >NUL 2>&1

REM Turn off Inventory Collector
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\InventoryCollector" /v AllowInventoryCollection /t REG_DWORD /d 0 /f >NUL 2>&1

REM Turn off Microsoft Defender Antivirus
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >NUL 2>&1

REM Turn off routine remediation
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRemediation /t REG_DWORD /d 1 /f >NUL 2>&1

REM Allow antimalware service to startup with normal priority
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MsMpEng" /v Startup /t REG_DWORD /d 3 /f >NUL 2>&1

REM Allow antimalware service to remain running always
reg add "HKLM\SYSTEM\CurrentControlSet\Services\MsMpEng" /v StayActive /t REG_DWORD /d 1 /f >NUL 2>&1

REM Configure App Install Control
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" /v DisableAppInstallControl /t REG_DWORD /d 1 /f >NUL 2>&1

REM Configure Windows Defender SmartScreen
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender SmartScreen" /v EnableSmartScreen /t REG_DWORD /d 0 /f >NUL 2>&1

REM Disable logging
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Windows Defender-Operational" /v Enable-OperationalChannel /t REG_DWORD /d 0 /f >NUL 2>&1

REM Do not send additional data
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Windows Defender-Operational" /v PublishWPP /t REG_DWORD /d 0 /f >NUL 2>&1

REM Disable Windows Error Reporting
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f >NUL 2>&1

REM Turn on Script Execution
reg add "HKLM\SOFTWARE\Microsoft\PowerShell\3.0" /v ExecutionPolicy /t REG_SZ /d Unrestricted /f >NUL 2>&1

REM Display highly detailed status messages
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows PowerShell" /v ShowDetailedErrorMessages /t REG_DWORD /d 1 /f >NUL 2>&1

REM Miscrosoft Customer Experience Improvement Program (CEIP)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >NUL 2>&1

REM Prevent participation in the Customer Experience Improvement Program
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v DisableCEIP /t REG_DWORD /d 1 /f >NUL 2>&1

REM Turn off the Windows Menssager Customer Experience Improvement Program
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Messaging" /v DisableCEIP /t REG_DWORD /d 1 /f >NUL 2>&1

REM Turn off Windows Customer Experience Improvement Program
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Customer Experience Improvement Program" /v TelemetryEnrollment /t REG_DWORD /d 0 /f >NUL 2>&1

REM Turn off Data Execution Prevention
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\MinAppSession" /v fDenyTSApplications /t REG_DWORD /d 0 /f >NUL 2>&1

REM Turn off Data Execution Prevention for Explorer
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe" /v DisableNX /t REG_DWORD /d 1 /f >NUL 2>&1

REM Turn off Data Execution Prevention for HTML Help Executible
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\hh.exe" /v DisableNX /t REG_DWORD /d 1 /f >NUL 2>&1

REM Disable new DMA devices when this computer is locked
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\AppLocker" /v DisableNewDMADevicesWhenLocked /t REG_DWORD /d 1 /f >NUL 2>&1

REM Turn On Virtualization Based Security
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Defender\SystemGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 1 /f >NUL 2>&1

REM Hide all notifications
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v HideAllNotifications /t REG_DWORD /d 1 /f >NUL 2>&1

REM Hide Windows Security Systray
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /v HideSecurityCenter /t REG_DWORD /d 1 /f >NUL 2>&1

REM Turn off Configuration
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SystemRestore\Configuration" /v DisableConfiguration /t REG_DWORD /d 1 /f >NUL 2>&1

REM Turn off System Restore
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v DisableSR /t REG_DWORD /d 1 /f >NUL 2>&1

REM Set MitigationAuditOptions
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\MitigationAuditOptions" /v AuditSystemPolicy /t REG_DWORD /d 22222222 /f >NUL 2>&1

REM Set MitigationOptions
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\MitigationOptions" /v AuditSystemPolicy /t REG_DWORD /d 22222222 /f >NUL 2>&1

REM Set MoveImages
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v MoveImages /t REG_DWORD /d 0x00000000 /f >NUL 2>&1

REM Set FeatureSettings
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettings /t REG_DWORD /d 0x1 /f >NUL 2>&1

REM Set FeatureSettingsOverride
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 0x3 /f >NUL 2>&1

REM Set FeatureSettingsOverrideMask
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 0x3 /f >NUL 2>&1

REM Set IOMMUFlags
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v IOMMUFlags /t REG_DWORD /d 0x0 /f >NUL 2>&1

REM Set Flags for HighContrast
reg add "HKCU\Control Panel\Accessibility\HighContrast" /v Flags /t REG_DWORD /d 0x0 /f >NUL 2>&1

REM Set Flags for Keyboard Response
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_DWORD /d 0x0 /f >NUL 2>&1

REM Set Flags for Mouse Keys
reg add "HKCU\Control Panel\Accessibility\Mouse Keys" /v Flags /t REG_DWORD /d 0x0 /f >NUL 2>&1

REM Set Flags for SoundSentry
reg add "HKCU\Control Panel\Accessibility\SoundSentry" /v Flags /t REG_DWORD /d 0x0 /f >NUL 2>&1

REM Set Flags for StickyKeys
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_DWORD /d 0x0 /f >NUL 2>&1

REM Set Flags for TimeOut
reg add "HKCU\Control Panel\Accessibility\TimeOut" /v Flags /t REG_DWORD /d 0x0 /f >NUL 2>&1

REM Set Flags for ToggleKeys
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_DWORD /d 0x0 /f >NUL 2>&1

REM Set MenuShowDelay
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_DWORD /d 0 /f >NUL 2>&1

REM Set MouseDataQueueSize for mouclass
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d 0x10 /f >NUL 2>&1

REM Set MouseDataQueueSize for kbdclass
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d 0x10 /f >NUL 2>&1

REM Bcdedit Tweaks
bcdedit /set isolatedcontext No >NUL 2>&1
bcdedit /set vsmlauchtype Off >NUL 2>&1
bcdedit /set disableelamdrivers Yes >NUL 2>&1
bcdedit /set allowedinmemorysettings 0x0 >NUL 2>&1
bcdedit /set loadoptions "DISABLE-LSA-ISO,DISABLE-VBS" >NUL 2>&1
bcdedit /set pciexpress forcedisable >NUL 2>&1
bcdedit /set nx alwaysoff >NUL 2>&1
bcdedit /set {current} description "GamingOS LTSC @heitor" >NUL 2>&1

REM Disable Systemtray Windows Defender
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --System --Privileged taskkill /im SecurityHealthSystray.exe" >NUL 2>&1
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --System --Privileged del /f C:\Windows\System32\SecurityHealthSystray" >NUL 2>&1

ECHO Enabling OptionalFeature Graphics Tool...
POWERSHELL $ProgressPreference-'SilentlyContinue' >NUL 2>&1
POWERSHELL Enable-WindowsOptionalFeature -Online -FeatureName GraphicsTools >NUL 2>&1

ECHO "Install DirectX Dependencies..." & pause>nul
POWERSHELL $ProgressPreference-'SilentlyContinue' >NUL 2>&1
POWERSHELL Invoke-WebRequest -UseBasicParsing -Uri https://github.com/heitorrosa/gamingos-ltsc-2021/raw/main/directx.exe -OutFile "C:\Windows\Temp\DirectX.exe"
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\DirectX.exe" >NUL 2>&1
ECHO "Install VisualCpp Dependencies..." & pause>nul

POWERSHELL $ProgressPreference-'SilentlyContinue' >NUL 2>&1
POWERSHELL Invoke-WebRequest -UseBasicParsing -Uri https://github.com/abbodi1406/vcredist/releases/download/v0.76.0/VisualCppRedist_AIO_x86_x64.exe -OutFile "C:\Windows\Temp\VisualCpp.exe"
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\VisualCpp.exe" >NUL 2>&1
ECHO "Install XNAFramework Dependencies..." & pause>nul

POWERSHELL $ProgressPreference-'SilentlyContinue' >NUL 2>&1
POWERSHELL Invoke-WebRequest -UseBasicParsing -Uri https://github.com/heitorrosa/gamingos-ltsc-2021/raw/main/xnafx40_redist.msi -OutFile "C:\Windows\Temp\xnaframework.msi"
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\xnaframework.msi" >NUL 2>&1
ECHO "Install .NET Framework 4.8.1 Dependencies..." & pause>nul

POWERSHELL $ProgressPreference-'SilentlyContinue' >NUL 2>&1
POWERSHELL Invoke-WebRequest -UseBasicParsing -Uri https://github.com/heitorrosa/gamingos-ltsc-2021/raw/main/NDP481-Web.exe -OutFile "C:\Windows\Temp\netframework.exe"
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\netframework.exe" >NUL 2>&1
pause

ECHO Updating Ngen...
POWERSHELL Set-ExecutionPolicy Unrestricted >NUL 2>&1
POWERSHELL cd C:\Windows\Microsoft.NET\Framework64\v4.0.30319 >NUL 2>&1
POWERSHELL .\ngen update >NUL 2>&1
POWERSHELL cd System32 >NUL 2>&1
POWERSHELL DISM /Online /Cleanup-Image /StartComponentCleanup /Resetbase /Defer >NUL 2>&1

ECHO Tweaking Services...
start https://cdn.discordapp.com/attachments/868975716035866624/1169772859120422972/image.png?ex=65569ede&is=654429de&hm=22600fa3ab658c093e8273fdc2f384ad5993e40cb64083c762447767b8e3ac74&
msconfig >NUL 2>&1
ECHO.
pause

REM Set the Start value for TrustedInstaller to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrustedInstaller" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for AudioEndpointBuilder to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AudioEndpointBuilder" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for Audiosrv to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Audiosrv" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for camsvc to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\camsvc" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for DeviceInstall to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DeviceInstall" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for Dhcp to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dhcp" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for LicenseManager to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LicenseManager" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for nsi to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nsi" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for Power to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Power" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for seclogon to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\seclogon" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for TabletInputService to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TabletInputService" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for WaaSMedicSvc to 4 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v Start /t REG_DWORD /d 4 /f  >NUL 2>&1

REM Set the Start value for Winmgmt to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Winmgmt" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for Netman to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Netman" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for NetSetupSvc to 2 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetSetupSvc" /v Start /t REG_DWORD /d 2 /f  >NUL 2>&1

REM Set the Start value for Schedule to 4 (Hexadecimal)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v Start /t REG_DWORD /d 4 /f  >NUL 2>&1

REM Set the dependencies for the NlaSvc service to NSI, RpcSs, TcpIp, Dhcp, and LicenseManager
sc config NlaSvc DependOnService=NSI RpcSs TcpIp Dhcp LicenseManager  >NUL 2>&1

sc config TrustedInstaller start=demand >NUL 2>&1
sc start TrustedInstaller >NUL 2>&1

REM Disable Cellcore Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop Cellcore" >NUL 2>&1

REM Disable Circular Kernel Context Logger Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop Circular Kernel Context Logger" >NUL 2>&1

REM Disable CloudExperienceHostOobe Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop CloudExperienceHostOobe" >NUL 2>&1

REM Disable DiagLog Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop DiagLog" >NUL 2>&1

REM Disable Diagtrack-Listener Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop Diagtrack-Listener" >NUL 2>&1

REM Disable EventLog-Security Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop EventLog-Security" >NUL 2>&1

REM Disable Microsoft-Windows-Rdp-Graphics-RdpIdd-Trace Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop Microsoft-Windows-Rdp-Graphics-RdpIdd-Trace" >NUL 2>&1

REM Disable RadioMgr Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop RadioMgr" >NUL 2>&1

REM Disable Netcore Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop Netcore" >NUL 2>&1

REM Disable EventLog-Application Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop EventLog-Application" >NUL 2>&1

REM Disable LwtNetLog Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop LwtNetLog" >NUL 2>&1

REM Disable EventLog-System Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop EventLog-System" >NUL 2>&1

REM Disable NtfsLog Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop NtfsLog" >NUL 2>&1

REM Disable Tpm Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop Tpm" >NUL 2>&1

REM Disable WdiContextLog Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop WdiContextLog" >NUL 2>&1

REM Disable WiFiDriverIHVSession Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop WiFiDriverIHVSession" >NUL 2>&1

REM Disable WiFiSession Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop WiFiSession" >NUL 2>&1

REM Disable WinPhoneCritical Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop WinPhoneCritical" >NUL 2>&1

REM Disable UBPM Trace Session
POWERSHELL Start-Process -FilePath "C:\Windows\Temp\minsudo.exe --TrustedInstaller --Privileged logman stop UBPM" >NUL 2>&1

ECHO Optimizing your Network Adapter...
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WmmPolicy" /v EnableThroughputPolicy /t REG_DWORD /d 1 /f >NUL 2>&1
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\WmmPolicy" /v TcpInboundThroughputLevel /t REG_DWORD /d 3 /f >NUL 2>&1
POWERSHELL netsh int tcp set security profiles=disable >NUL 2>&1
POWERSHELL netsh int tcp set global autotuninglevel=experimental >NUL 2>&1
POWERSHELL netsh int tcp set supp internet congestionprovider=newreno >NUL 2>&1
REG add "HKLM\SYSTEM\CurrentControlSet\Control" /v SvcHostSplitThresholdInKB /t REG_DWORD /d ffffffff /f >NUL 2>&1
sc config nlasvc start=auto >NUL 2>&1
sc start nlasvc >NUL 2>&1
REM Disable automatic proxy detection
REG add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Connections" /v DetectAutomatically /t REG_DWORD /d 0 /f >NUL 2>&1

sc start sppsvc >NUL 2>&1
sc start OneSyncSvc_1a112 >NUL 2>&1
sc start SgrmBroker >NUL 2>&1
sc start AarSvc_1a112 >NUL 2>&1
sc start cbdhsvc_1a112 >NUL 2>&1
sc start ConsentUxUserSvc_1a112 >NUL 2>&1
sc start CredentialEnrollmentManagerUserSvc_1a112 >NUL 2>&1
sc start DeviceAssociationBrokerSvc_1a112 >NUL 2>&1
sc start DevicePickerUserSvc_1a112 >NUL 2>&1
sc start DevicesFlowUserSvc_1a11 >NUL 2>&1
sc start EntAppSvc >NUL 2>&1
sc start BcastDVRUserService_1a112 >NUL 2>&1
sc start PrintWorkflowUserSvc_1a112 >NUL 2>&1
sc start UdkUserSvc_1a112 >NUL 2>&1
sc start AppIDSvc >NUL 2>&1
sc start ClipSVC >NUL 2>&1
sc start NetSetupSvc >NUL 2>&1

REM Set the Network Location to Private for all networks
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Network List Manager\Profiles\Private" /v Category /t REG_DWORD /d 2 /f >NUL 2>&1
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Network List Manager\Profiles\Unidentified Network" /v Category /t REG_DWORD /d 2 /f >NUL 2>&1
REG add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Network List Manager\Profiles\Identifying Network" /v Category /t REG_DWORD /d 2 /f >NUL 2>&1

ECHO Minor Power Tweaks...
POWERCFG -h off >NUL 2>&1

pause
shutdown -r -t 0
