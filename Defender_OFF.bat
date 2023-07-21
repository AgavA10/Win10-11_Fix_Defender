cd  /d  "%~dp0"

SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" -ot reg -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" -ot reg -actn ace -ace "n:S-1-5-32-544;p:full"

SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" -ot reg -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows Defender\Features" -ot reg -actn ace -ace "n:S-1-5-32-544;p:full"

SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows Defender" -ot reg -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows Defender" -ot reg -actn ace -ace "n:S-1-5-32-544;p:full"

SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mpcmdrun.exe" -ot reg -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mpcmdrun.exe" -ot reg -actn ace -ace "n:S-1-5-32-544;p:full"

reg add "HKCU\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows Defender" /v "ServiceStartStates" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows Defender" /v "PUAProtection" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows Defender" /v "IsServiceRunning" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows Defender" /v "PassiveMode" /t REG_DWORD /d "1" /f

FOR %%a IN (WdFilter  WdNisDrv  WdNisSvc  WinDefend  WdBoot  Sense  wscsvc  SysMain  WerSvc  UsoSvc  WpnService) DO (

SetACL.exe -on %%a -ot srv -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on %%a -ot srv -actn ace -ace "n:S-1-5-32-544;p:full"

sc config %%a start= disabled

SetACL.exe -on "HKLM\SYSTEM\ControlSet001\Services\%%a" -ot reg -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "HKLM\SYSTEM\ControlSet001\Services\%%a" -ot reg -actn ace -ace "n:S-1-5-32-544;p:full"
SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Services\%%a" -ot reg -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "HKLM\SYSTEM\CurrentControlSet\Services\%%a" -ot reg -actn ace -ace "n:S-1-5-32-544;p:full"

reg add "HKLM\SYSTEM\ControlSet001\Services\%%a" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%a" /v "Start" /t REG_DWORD /d "4" /f

sc delete %%a

)



pause


%windir%\system32\shutdown.exe -r -t 00






