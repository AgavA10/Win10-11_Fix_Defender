cd  /d  "%~dp0"

@REM make mistake!!
SetACL.exe -on "%systemdrive%\Program Files (x86)\Windows Defender" -ot file -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "%systemdrive%\Program Files (x86)\Windows Defender" -ot file -actn ace -ace  "n:S-1-5-32-544;p:full"

SetACL.exe -on "%systemdrive%\Program Files\Windows Defender" -ot file -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "%systemdrive%\Program Files\Windows Defender" -ot file -actn ace -ace  "n:S-1-5-32-544;p:full"

SetACL.exe -on "%systemdrive%\Program Files\Windows Defender Advanced Threat Protection" -ot file -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "%systemdrive%\Program Files\Windows Defender Advanced Threat Protection" -ot file -actn ace -ace  "n:S-1-5-32-544;p:full"

SetACL.exe -on "%systemdrive%\Program Data\Microsoft\Windows Defender" -ot file -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "%systemdrive%\Program Data\Microsoft\Windows Defender" -ot file -actn ace -ace  "n:S-1-5-32-544;p:full"

SetACL.exe -on "%systemdrive%\Program Data\Microsoft\Windows Defender Advanced Threat Protection" -ot file -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "%systemdrive%\Program Data\Microsoft\Windows Defender Advanced Threat Protection" -ot file -actn ace -ace  "n:S-1-5-32-544;p:full"


FOR %%a IN (EppManifest.dll MpAsDesc.dll MpClient.dll MsMpLics.dll MpOAV.dll MpDetoursCopyAccelerator.dll MpDetours.dll  MpCmdRun.exe  AMMonitoringProvider.dll  ConfigSecurityPolicy.exe  DefenderCSP.dll   endpointdlp.dll  MpAzSubmit.dll  MpCommu.dll  MpCopyAccelerator.exe  MpDlpCmd.exe  MpEvMsg.dll  MpProvider.dll  MpRtp.dll  MpSvc.dll  MpSvc.dll   MsMpCom.dll  MsMpRes.dll  NisSrv.exe  ProtectionManagement.dll  shellext.dll  MsMpEng.exe  MsSense.exe  SenseCncProxy.exe  SenseCncPS.dll  SenseIR.exe  SenseMirror.dll  SenseSampleUploader.exe  WATPCSP.dll Offline\EppManifest.dll  Offline\MsMpLics.dll  Offline\OfflineScannerShell.exe ) DO (

SetACL.exe -on "%systemdrive%\Program Files\Windows Defender\%%a" -ot file -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "%systemdrive%\Program Files\Windows Defender\%%a" -ot file -actn ace -ace  "n:S-1-5-32-544;p:full"

cd  /d   "%systemdrive%\Program Files (x86)\Windows Defender"

attrib  -r  %%a
del /f /s /q %%a

cd  /d  "%~dp0"

SetACL.exe -on "%systemdrive%\Program Files\Windows Defender\%%a" -ot file -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "%systemdrive%\Program Files\Windows Defender\%%a" -ot file -actn ace -ace  "n:S-1-5-32-544;p:full"

cd  /d   "%systemdrive%\Program Files\Windows Defender"

attrib  -r  %%a
del /f /s /q %%a

cd  /d  "%~dp0"

SetACL.exe -on "%systemdrive%\Program Files\Windows Defender Advanced Threat Protection\%%a" -ot file -actn setowner -ownr "n:S-1-5-32-544"
SetACL.exe -on "%systemdrive%\Program Files\Windows Defender Advanced Threat Protection\%%a" -ot file -actn ace -ace  "n:S-1-5-32-544;p:full"

cd  /d   "%systemdrive%\Program Files\Windows Defender Advanced Threat Protection"

attrib  -r  %%a
del /f /s /q %%a

cd  /d  "%~dp0"
)

cd  /d   "%systemdrive%\Program Files (x86)\Windows Defender"
attrib  -r *.exe
attrib  -r *.dll
attrib  -r *.mof
attrib  -r *.txt
del /f /s /q  *.dll
del /f /s /q *.exe
del /f /s /q *.mof
del /f /s /q *.txt

cd  /d   "%systemdrive%\Program Files\Windows Defender"
attrib  -r *.exe
attrib  -r *.dll
attrib  -r *.mof
attrib  -r *.txt
del /f /s /q  *.dll
del /f /s /q *.exe
del /f /s /q *.mof
del /f /s /q *.txt

cd  /d   "%systemdrive%\Program Files\Windows Defender Advanced Threat Protection"
attrib  -r *.exe
attrib  -r *.dll
attrib  -r *.mof
attrib  -r *.txt
del /f /s /q  *.dll
del /f /s /q *.exe
del /f /s /q *.mof
del /f /s /q *.txt

rd /s /q "%systemdrive%\Program Files (x86)\Windows Defender"
rd /s /q "%systemdrive%\Program Files\Windows Defender"
rd /s /q "%systemdrive%\Program Files\Windows Defender Advanced Threat Protection"
rd /s /q "%systemdrive%\Program Data\Microsoft\Windows Defender"
rd /s /q "%systemdrive%\Program Data\Microsoft\Windows Defender Advanced Threat Protection"





pause
