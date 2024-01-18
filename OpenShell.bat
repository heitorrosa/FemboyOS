@echo off
:: This file is integrated with the iso installation, for better automation
title FemboyOS @heitorrosa
echo y | rmdir /s "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Open-Shell" >NUL 2>&1
reg add "HKCU\Software\OpenShell\StartMenu" /v "ShowedStyle2" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\OpenShell" /v "LastUpdateTime" /t REG_DWORD /d "370832706" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\OpenShell\Settings" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu" /v "ShowedStyle2" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu" /v "CSettingsDlg" /t REG_BINARY /d "a8000000420000000000000000000000900c00000000000000000000" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu" /v "OldItems" /t REG_BINARY /d "" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu" /v "ItemRanks" /t REG_BINARY /d "48534c430100000000000000ac856907010000006a35da01ef290e0c01000000194ada0159066c1209000000244ada018e2aa117010000006b3bda01c1612024010000008235da0190a3632601000000e43ada01f0694b30030000006b45da01cc7d203601000000ad3dda0150982144020000002b38da019df6414e010000008f49da01a8e9ed61030000004747da01ab34886501000000c248da01b6f35366010000006a35da01c092a76c01000000c448da01e750857405000000f548da011e21517e010000006e35da01ed4ee07e010000008249da018730c295010000000c38da0135b14299010000007e49da010d0a62af010000003939da017b116eb001000000194ada010d64bdb30c000000b949da01ca043cb4020000005347da01466e47c3010000006a35da01321371c80a0000009a49da01117629d1010000003447da0149d7a4d803000000ab3dda01772cbae5020000002b38da0106baabec010000007735da01b013f0f007000000ac49da01be2d91f106000000c749da01f55d96fc010000006a35da01" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu" /v "CEditMenuDlg7" /t REG_BINARY /d "de0200002f0100000000000000000000" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Order" /v "F7C85F56" /t REG_BINARY /d "8c462cf68ce78cf8af9aa4af00000000" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Order" /v "61D76F71" /t REG_BINARY /d "d0ec64730d64bdb3f8a4f1c5d1d18873" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "Version" /t REG_DWORD /d "67371178" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkinW7" /t REG_SZ /d "Metro" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkinVariationW7" /t REG_SZ /d "" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkinOptionsW7" /t REG_MULTI_SZ /d "USER_IMAGE=0\0SMALL_ICONS=0\0LARGE_FONT=0\0DISABLE_MASK=0\0OPAQUE=0\0TRANSPARENT_LESS=1\0TRANSPARENT_MORE=0\0WHITE_SUBMENUS2=0" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "SkipMetro" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "ShiftClick" /t REG_SZ /d "Nothing" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "ShiftWin" /t REG_SZ /d "Nothing" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "AllProgramsMetro" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "OpenPrograms" /t REG_DWORD /d "1" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "RecentPrograms" /t REG_SZ /d "None" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "HybridShutdown" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "HighlightNew" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "HighlightNewApps" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "CheckWinUpdates" /t REG_DWORD /d "0" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "GlassOpacity" /t REG_DWORD /d "100" /f >NUL 2>&1
reg add "HKCU\SOFTWARE\OpenShell\StartMenu\Settings" /v "MenuItems7" /t REG_MULTI_SZ /d "Item1.Command=user_files\0Item1.Settings=ITEM_DISABLED\0Item2.Command=user_documents\0Item2.Settings=ITEM_DISABLED\0Item3.Command=user_pictures\0Item3.Settings=ITEM_DISABLED\0Item4.Command=user_music\0Item4.Settings=ITEM_DISABLED\0Item5.Command=user_videos\0Item5.Settings=ITEM_DISABLED\0Item6.Command=downloads\0Item6.Settings=ITEM_DISABLED\0Item7.Command=homegroup\0Item7.Settings=ITEM_DISABLED\0Item8.Command=separator\0Item9.Command=games\0Item9.Settings=TRACK_RECENT|NOEXPAND|ITEM_DISABLED\0Item10.Command=favorites\0Item10.Settings=ITEM_DISABLED\0Item11.Command=recent_documents\0Item11.Settings=ITEM_DISABLED\0Item12.Command=computer\0Item12.Settings=NOEXPAND\0Item13.Command=network\0Item13.Settings=ITEM_DISABLED\0Item14.Command=network_connections\0Item14.Settings=ITEM_DISABLED\0Item15.Command=separator\0Item16.Command=pc_settings\0Item16.Settings=TRACK_RECENT\0Item17.Command=control_panel\0Item17.Settings=TRACK_RECENT\0Item18.Command=admin\0Item18.Settings=TRACK_RECENT|ITEM_DISABLED\0Item19.Command=devices\0Item19.Settings=ITEM_DISABLED\0Item20.Command=defaults\0Item20.Settings=ITEM_DISABLED\0Item21.Command=help\0Item21.Settings=ITEM_DISABLED\0Item22.Command=run\0Item23.Command=apps\0Item23.Settings=ITEM_DISABLED\0Item24.Command=windows_security\0Item24.Settings=ITEM_DISABLED" /f >NUL 2>&1
:: Import OpenShell XML file
curl -g -k -L -# -o "C:\Windows\Temp\OpenShell.xml" "https://github.com/heitorrosa/FemboyOS/blob/iotltsc/OpenShell.xml" >NUL 2>&1 & powershell Start-Process -FilePath "C:\Program Files\Open-Shell\StartMenu.exe -xml C:\Windows\Temp\OpenShell.xml" >NUL 2>&1