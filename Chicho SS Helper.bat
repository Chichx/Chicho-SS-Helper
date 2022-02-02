@echo off
title Chicho SS Helper
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

md %appdata%\ChichoSSHelper
curl -1 icanhazip.com 1> tmpwanip & cls & set /p ipv4= < tmpwanip & set /p ipv4= < tmpwanip & del /f tmpwanip
SET chicho_webhook=

:variables
set g=[92m
set r=[91m
set red=[04m
set l=[1m
set w=[0m
set b=[94m
set m=[95m
set p=[35m
set c=[35m
set d=[96m
set u=[0m
set z=[91m
set n=[96m
set y=[40;33m
set g2=[102m
set r2=[101m
set t=[40m

:check
ping www.google.com -n 1 -w 1000 >nul
if errorlevel 1 (echo An error has occured. Please connect to internet and try again. & timeout /t 3 >nul & exit /b) else (goto :connected)

:connected
for /f %%A in ('curl -k -s https://pastebin.com/raw/0aB3jUtj') do set "auth=%%A"

:hwidvars
for /f "tokens=2 delims==" %%A in ('wmic csproduct get uuid /format:value ^| find "="') do set uuid=%%A

:auth
set hwid=%uuid%
if "%auth%"=="%hwid%" (goto :success) else (goto :fail)

:success
color a
echo.
echo %u%[%g%+%u%] %g%Successfully authenticated.
echo %u%Your HWID: %g%%hwid%
echo.
echo %u%Created by: %g%Chicho#7585
echo %u%Github: %g%https://github.com/Gastxn
echo %u%Version: %g%1.5
echo.
curl -H "Accept: application/json" -H "Content-Type:multipart/form-data" -X POST -F "payload_json={\"username\": \"Auth secure\", \"embeds\": [{\"title\": \"Successfully authenticated.\", \"color\": 5220458, \"fields\": [{\"name\": \":man_pouting: **Username**\", \"value\": \"%username%\"}, {\"name\": \":computer: **Computer Name** \", \"value\": \"%COMPUTERNAME% \"}, {\"name\": \":computer: **HWID** \", \"value\": \"%hwid% \"}, {\"name\": \":window: **OS** \", \"value\": \"%os% \"}, {\"name\": \":detective: **IP** \", \"value\": \"**%ipv4%** \"}],\"thumbnail\":{\"url\": \"https://i.imgur.com/8WBaKK8.png\"},\"footer\":{\"text\": \"Opened on %date% - %time%\"}}]}" %chicho_webhook%
timeout /t 4 >nul & cls & goto menu

:fail
color 0C
echo.
echo %hwid% | CLIP
echo %u%[%r%-%u%] %r%Not Authenticated...
echo %r%HWID copied to clipboard.
echo Add to chicho#7585 to access the Chicho SS Helper
curl -H "Accept: application/json" -H "Content-Type:multipart/form-data" -X POST -F "payload_json={\"username\": \"Auth secure\", \"embeds\": [{\"title\": \"Not Authenticated...\", \"color\": 12713984, \"fields\": [{\"name\": \":man_pouting: **Username**\", \"value\": \"%username%\"}, {\"name\": \":computer: **Computer Name** \", \"value\": \"%COMPUTERNAME% \"}, {\"name\": \":computer: **HWID** \", \"value\": \"%hwid% \"}, {\"name\": \":window: **OS** \", \"value\": \"%os% \"}, {\"name\": \":detective: **IP** \", \"value\": \"**%ipv4%** \"}],\"thumbnail\":{\"url\": \"https://i.imgur.com/jqWZcxa.png\"},\"footer\":{\"text\": \"Opened on %date% - %time%\"}}]}" %chicho_webhook%
rmdir /s /q %appdata%\ChichoSSHelper
echo.
timeout /t 4 >nul & exit /b

:Presets
cls
echo Choose a Preset.
echo %b%Blue%u%, %d%Cyan%u%, %g%Green%u%, %y%Yellow%u%, %r%Red%u%.
set /p preset=
if /i %preset%==Blue goto Blue
if /i %preset%==Cyan goto Cyan
if /i %preset%==Yellow goto Yellow
if /i %preset%==Green goto Green
if /i %preset%==Red goto Red
echo %c%Please enter a valid option.
timeout /t 1 /nobreak >nul
goto Presets

:Blue
set c=%b%
set u=%u%
set d=%n%
goto menu

:Yellow
set c=%y%
set u=%u%
set d=%n%
goto menu

:Green
set c=%g%
set u=%u%
set d=%n%
goto menu

:Cyan
set c=%d%
set u=%u%
set d=%d%
goto menu

:Red
set c=%r%
set u=%u%
set d=%r%
goto menu

:menu
cls
chcp 65001 >nul 
echo.
echo     %c%    ██████╗██╗  ██╗██╗ ██████╗██╗  ██╗ ██████╗     ███████╗███████╗    ██╗  ██╗███████╗██╗     ██████╗ 
echo        ██╔════╝██║  ██║██║██╔════╝██║  ██║██╔═══██╗    ██╔════╝██╔════╝    ██║  ██║██╔════╝██║     ██╔══██╗
echo        ██║     ███████║██║██║     ███████║██║   ██║    ███████╗███████╗    ███████║█████╗  ██║     ██████╔╝%u%
echo        ██║     ██╔══██║██║██║     ██╔══██║██║   ██║    ╚════██║╚════██║    ██╔══██║██╔══╝  ██║     ██╔═══╝ 
echo        ╚██████╗██║  ██║██║╚██████╗██║  ██║╚██████╔╝    ███████║███████║    ██║  ██║███████╗███████╗██║     
echo         ╚═════╝╚═╝  ╚═╝╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝     ╚══════╝╚══════╝    ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     
echo.
echo %c%                       ╔═════════════════════════════════╦════════════════════════════╗ %u%
echo                        %c%║%u% [%c%1%u%] Macros                      %c%║%u% [%c%7%u%] Explorer               %c%║%u%
echo                        %c%║%u% [%c%2%u%] Sites                       %c%║%u% [%c%8%u%] Journal paths          %c%║%u%
echo                        %c%║%u% [%c%3%u%] Record                      %c%║%u% [%c%9%u%] Commands               %c%║%u%
echo                        %c%║%u% [%c%4%u%] Manual Tools                %c%║%u% [%c%10%u%] Registry Paths        %c%║%u%
echo                        %c%║%u% [%c%5%u%] Recovery Files Tools        %c%║%u% [%c%11%u%] EventViewer           %c%║%u%
echo                        %c%║%u% [%c%6%u%] Automatic Tools             %c%║%u% [%c%12%u%] HWID Extractor        %c%║%u%
echo %c%                       ╚═════════════════════════════════╩════════════════════════════╝
echo %c%                             ║                %u% [%c%13%u%] Theme presets%c%               ║
echo %c%                             ║                %u% [%c%Quit%u%] Destruct%c%                  ║
echo %c%                             ╚══════════════════════════════════════════════════╝
echo %u%                                                     Theme %c%%preset%
echo %u%                                               Licensed to %c%%username%
tasklist /fi "ImageName eq Javaw.exe" /fo csv 2>nul | find /I "Javaw" >nul
if "%ERRORLEVEL%"=="0" echo                                                 %g%Minecraft found.%white%
if "%ERRORLEVEL%"=="1" echo                                                 %r%Minecraft not found.%white%
echo.
set /p M="%c%Please, choose:%u% "
if %M%==1 goto Macro
if %M%==2 goto BlockedSites
if %M%==3 goto RecordingSoftwares
if %M%==4 goto A
if %M%==5 goto B
if %M%==6 goto C
if %M%==7 goto D
if %M%==8 goto E
if %M%==9 goto F
if %M%==10 goto G
if %M%==11 goto H
if %M%==12 goto hwid
if %M%==13 goto presets
if %M%==Quit goto Destruct

echo %c%Please enter a valid option.
timeout /t 1 /nobreak >nul
goto menu


::Credits Rancio Modified for Chicho
:hwid
cd %appdata%\ChichoSSHelper\

echo User Name       : %UserName% > %appdata%\ChichoSSHelper\HWID.txt
echo Computer Name   : %ComputerName% >> %appdata%\ChichoSSHelper\HWID.txt
echo User Domain     : %UserDomain% >> %appdata%\ChichoSSHelper\HWID.txt

goto :other
:other
Powershell "wmic path win32_computersystemproduct get uuid" >> %appdata%\ChichoSSHelper\"HWID.txt"
Powershell "getmac" >> %appdata%\ChichoSSHelper\"HWID.txt"
Powershell "Get-WmiObject -Class Win32_Processor -ComputerName. | Select-Object -Property ProcessorId*" >> %appdata%\ChichoSSHelper\"HWID.txt"
Powershell "wmic diskdrive get serialnumber" >> %appdata%\ChichoSSHelper\"HWID.txt"
Powershell "wmic memorychip get serialnumber" >> %appdata%\ChichoSSHelper\"HWID.txt"
Powershell "wmic baseboard get serialnumber" >> %appdata%\ChichoSSHelper\"HWID.txt"
Powershell "wmic cpu get name">>%appdata%\ChichoSSHelper\HWID.txt
cd "%appdata%\ChichoSSHelper\"
curl -H "Accept: application/json" -H "Content-Type:multipart/form-data" -X POST -F "file=@HWID.txt" -F "payload_json={\"content\":\":warning: **Chicho SS Helper SECURITY!** :warning:\n\n:man_pouting: **Username**: %username% \n:window: **OS**: %os%\n:computer: **Computer Info**: \"}" %chicho_webhook%
cls
echo Done.
pause
start %appdata%\ChichoSSHelper\"HWID.txt"
cls
goto menu

:: Programas Manuales
:A
cls
echo %c%Manual Tools
echo %u%[%c%PH2%u%] Download Process Hacker 2
echo %u%[%c%LAV%u%] Download LastActivityView
echo %u%[%c%WPV%u%] Download WinPrefetchView
echo %u%[%c%LYT%u%] Download Luyten
echo %u%[%c%ERT%u%] Download Everything
echo %u%[%c%ASV%u%] Download AlternateStreamView
echo %u%[%c%RGS%u%] Download RegScanner
echo %u%[%c%EPF%u%] Download ExecutedProgramFiles
echo %u%[%c%MCV%u%] Download MUICacheView
echo %u%[%c%SBV%u%] Download ShellBagsView
echo %u%[%c%BDV%u%] Download Browser Download View
echo %u%[%c%BHV%u%] Download BrowsingHistoryView
echo %u%[%c%OFV%u%] Download OpenSaveFilesView
echo %u%[%c%RFV%u%] Download RecentFilesView
echo %u%[%c%LDV%u%] Download Loaded DLL View
echo %u%[%c%HV%u%] Download History Viewer
echo %u%[%c%CPL%u%] Download Cached Program List
echo %u%[%c%WF%u%] Download WizFile
echo %u%[%c%PSFE%u%] Download PcaSvcFileExplorer
echo %u%[%c%DF%u%] Download DREFiles
echo %u%[%c%NUV%u%] Download NetworkUsageView
echo %u%[%c%MLS%u%] Download MyLastSearch
echo %u%[%c%UDL%u%] Download USBDriveLog
echo %u%[%c%WDTV%u%] Download WinDefTreathsView
echo %u%[%c%KBSV%u%] Download KeyBoardStateView
echo %u%[%c%JLV%u%] Download JumpListView
echo %u%[%c%ADS%u%] Download Alternate Data Steam
echo %u%[%c%JT%u%] Download JournalTrace
echo %u%[%c%PH%u%] Download Process Hollowing
echo %u%[%c%HP%u%] Download Hidden Process Detector
echo %u%[%c%Menu%u%] Go Menu
echo.
set /p M="%c%Please, choose:%u% "
if %M%==PH2 goto ProcessHacker2
if %M%==LAV goto LastActivityView
if %M%==WPV goto WinPrefetchView
if %M%==LYT goto Luyten
if %M%==ERT goto Everything
if %M%==ASV goto AlternateStreamView
if %M%==PFR goto PreviousFilesRecovery
if %M%==RGS goto RegScanner
if %M%==EPF goto ExecutedProgramFiles
if %M%==MCV goto MUICacheView
if %M%==SBV goto ShellBagsView
if %M%==BDV goto BrowserDownloadView
if %M%==BHV goto BrowsingHistoryView
if %M%==OFV goto OpenSaveFilesView
if %M%==RFV goto RecentFilesView
if %M%==LDV goto LoadedDLLView
if %M%==HV goto HistoryViewer
if %M%==CPL goto CachedProgramList
if %M%==WF goto WizFile
if %M%==PSFE goto PcaSvcFileExplorer
if %M%==DR goto DREFiles
if %M%==NUV goto NetworkUsageView
if %M%==MLS goto MyLastSearch
if %M%==UDL goto USBDriveLog
if %M%==WDTV goto WinDefTreathsView
if %M%==KBSV goto KeyBoardStateView
if %M%==JLV goto JumpListView
if %M%==ADS goto AlternateDataSteam
if %M%==JT goto JournalTrace
if %M%==PH goto ProcessHollowing
if %M%==HP goto ProcessHidden
if %M%==Menu goto menu
echo %c%Please enter a valid option.
timeout /t 1 /nobreak >nul
goto A

:B
cls
echo %c%Recovery Files Tools
echo %u%[%c%Clever%u%] Download Clever Recover Files
echo %u%[%c%Previous%u%] Download Previous Files Recovery
echo %u%[%c%EaseUS%u%] Download EaseUS
echo %u%[%c%Glarysoft%u%] Download Glarysoft
echo %u%[%c%Recuva%u%] Download Recuva
echo %u%[%c%KickAss%u%] Download KickAssUndelete
echo %u%[%c%Hetman%u%] Download Hetman
echo %u%[%c%Remo%u%] Download RemoRecover
echo %u%[%c%Menu%u%] Go Menu
echo.
set /p M="%c%Please, choose:%u% "
if %M%==Clever goto Clever
if %M%==Previous goto Previous
if %M%==EaseUS goto EaseUS
if %M%==Glarysoft goto Glarysoft
if %M%==Recuva goto Recuva
if %M%==KickAss goto KickAss
if %M%==Hetman goto Hetman
if %M%==Remo goto Remo
if %M%==Menu goto menu
echo %c%Please enter a valid option.
timeout /t 1 /nobreak >nul
goto B

:C
cls
echo %c%Automatic Tools
echo %u%[%c%Echo%u%] Download Echo
echo %u%[%c%Paladin%u%] Download Paladin
echo %u%[%c%SMT%u%] Download SMT
echo %u%[%c%Avenge%u%] Download Avenge
echo %u%[%c%Actova%u%] Download Actova
echo %u%[%c%Menu%u%] Go Menu
echo.
set /p M="%c%Please, choose:%u% "
if %M%==Echo goto Echo
if %M%==Paladin goto Paladin
if %M%==SMT goto SMT
if %M%==Avenge goto Avenge
if %M%==Actova goto Actova
if %M%==Menu goto menu
echo %c%Please enter a valid option.
timeout /t 1 /nobreak >nul
goto C

:D
cls
echo %c%Explorer
echo %u%[%c%PRE%u%] Prefetch
echo %u%[%c%TEMP%u%] Temp
echo %u%[%c%MC%u%] .Minecraft
echo %u%[%c%RB%u%] RecycleBin
echo %u%[%c%BP%u%] Background Programs
echo %u%[%c%RN%u%] Recent
echo %u%[%c%Menu%u%] Go Menu
echo.
set /p M="%c%Please, choose:%u% "
if %M%==PRE goto Prefetch
if %M%==TEMP goto Temp
if %M%==MC goto Puntominecraft
if %M%==RB goto RecycleBin
if %M%==BP goto BackgroundP
if %M%==RN goto Recent
if %M%==Menu goto menu
echo %c%Please enter a valid option.
timeout /t 1 /nobreak >nul
goto D

:E
cls
echo %c%Journal Paths
echo %u%[%c%JSC%u%] Security changes
echo %u%[%c%JER%u%] Explorer restart
echo %u%[%c%JDF%u%] Deleted files
echo %u%[%c%JRF%u%] Renamed files
echo %u%[%c%JFS%u%] File streams
echo %u%[%c%JFT%u%] File Type
echo %u%[%c%JJC%u%] Jarcache
echo %u%[%c%Menu%u%] Go Menu
echo.
set /p M="%c%Please, choose:%u% "
if %M%==JDF goto journalDeletedFiles
if %M%==JRF goto journalRenamedFiles
if %M%==JFT goto journalFileType
if %M%==JFS goto journalFileStream
if %M%==JER goto journalExplorerRestart
if %M%==JJC goto journalJarcache
if %M%==JSC goto journalSecurityChanges
if %M%==Menu goto menu
echo %c%Please enter a valid option.
timeout /t 1 /nobreak >nul
goto D

:F
cls
echo %c%CMD and Powershell Commmands
echo %u%[%c%TL%u%] TaskList
echo %u%[%c%CH%u%] ConsoleHost History (Powershell Commands)
echo %u%[%c%IC%u%] IpConfig
echo %u%[%c%TRE%u%] Tree
echo %u%[%c%SC%u%] Shadows Copies
echo %u%[%c%MMA%u%] MMAgent
echo %u%[%c%DPS%u%] View DPS Process
echo %u%[%c%PCA%u%] View PcaSvc Process
echo %u%[%c%EVL%u%] View Eventlog Process
echo %u%[%c%SYS%u%] View SysMain Process
echo %u%[%c%DIA%u%] View DiagTrack Process
echo %u%[%c%APPI%u%] View Appinfo Process
echo %u%[%c%NS%u%] Check if Ntfs logs are enabled
echo %u%[%c%Menu%u%] Go Menu
echo.
set /p M="%c%Please, choose:%u% "
if %M%==NS goto NtfsLogsState
if %M%==CH goto ConsoleHost
if %M%==IC goto IpConfig
if %M%==TRE goto Tree
if %M%==SC goto ShadowsCopies
if %M%==TL goto TaskList
if %M%==MMA goto MMAgent
if %M%==DPS goto QueryDPS
if %M%==PCA goto QueryPcaSvc
if %M%==EVL goto QueryEventlog
if %M%==SYS goto QuerySysMain
if %M%==DIA goto QueryDiagTrack
if %M%==APPI goto QueryAppInfo
if %M%==Menu goto menu
echo %c%Please enter a valid option.
timeout /t 1 /nobreak >nul
goto E

:G
cls
echo %c%Registry Paths
echo %u%[%c%EF%u%] Executable files ran
echo %u%[%c%DR%u%] Disallow Run
echo %u%[%c%MCC%u%] MuiChache
echo %u%[%c%AH%u%] Arc History
echo %u%[%c%APPS%u%] App Switched
echo %u%[%c%UA%u%] User Assist
echo %u%[%c%EP%u%] Executed programs
echo %u%[%c%FA%u%] File type associations
echo %u%[%c%OS%u%] Files opened with Open/Save dialog-box
echo %u%[%c%MV%u%] Mounted volumes
echo %u%[%c%PF%u%] Prefetch parameters
echo %u%[%c%OP%u%] OpenWhitelist
echo %u%[%c%RD%u%] Recent Docs
echo %u%[%c%SJV%u%] ShowJumpView
echo %u%[%c%LVP%u%] LastVisitedPidlMRU
echo %u%[%c%EN%u%] Environment
echo %u%[%c%FR%u%] Firewall Rules
echo %u%[%c%UN%u%] Uninstall
echo %u%[%c%PS%u%] Property Store
echo %u%[%c%DI%u%] Direct Input
echo %u%[%c%SFD%u%] Set File Date
echo %u%[%c%CSM%u%] CIDsizeMRU
echo %u%[%c%TPS%u%] TypedPaths
echo %u%[%c%SMI%u%] StartMenuInternet
echo %u%[%c%CP%u%] Command Processor
echo %u%[%c%VIC%u%] VolumeInfoCache
echo %u%[%c%HKID%u%] HKIDs (AMD ONLY)
echo %u%[%c%USBS%u%] USB Storage


echo %u%[%c%Menu%u%] Go Menu
echo. 
set /p M="%c%Please, choose:%u% "
if %M%==EF goto ExecutableFilesRan
IF %M%==DR goto DisallowRun
IF %M%==MCC goto MuiCache
IF %M%==AH goto ArcHistory
IF %M%==APPS goto AppSwitched
IF %M%==UA goto UserAssist
if %M%==EP goto ExecutedPrograms
if %M%==FA goto FileTypeAssociations
if %M%==OS goto OpenSaveDialogBox
if %M%==PF goto PrefetchParameters
if %M%==MV goto MountedVolumes
if %M%==OP goto OpenWhitelist
if %M%==RD goto RecentDocs
if %M%==SJV goto ShowJumpView
if %M%==LVP goto LastVisitedPidlMRU
if %M%==EN goto Environment
if %M%==FR goto FirewallRules
if %M%==UN goto Uninstall
if %M%==PS goto PropertyStore
if %M%==DI goto DirectInput
if %M%==SFD goto SetFileDate
if %M%==CSM goto CIDsizeMRU
if %M%==TPS goto TypedPaths
if %M%==SMI goto StartMenuInternet
if %M%==CP goto CommandProcessor
if %M%==VIC goto VolumeInfoCache
if %M%==HKID goto HKIDS
if %M%==USBS goto USBStorage
if %M%==Menu goto menu
echo %c%Please enter a valid option.
timeout /t 1 /nobreak >nul
goto F

:H
cls
echo %c%EventViewer Logs
echo %u%[%c%TC%u%] Check for Time change
echo %u%[%c%UC%u%] Check for User Change
echo %u%[%c%EE%u%] Check for Event end
echo %u%[%c%LS%u%] Check for Logout Session
echo %u%[%c%LSS%u%] Check for Login Session 
echo %u%[%c%AJ%u%] Check Applications logs for deleted journal
echo %u%[%c%NJ%u%] Check Ntfs logs for deleted journal
echo %u%[%c%USB%u%] Check USB Connected
echo %u%[%c%Menu%u%] Go Menu
echo.
set /p M="%c%Please, choose:%u% "
if %M%==TC goto TimeChange
if %M%==UC goto UserChange
if %M%==EE goto EventEnd
if %M%==LS goto LogoutSession
if %M%==LSS goto LoginSession
if %M%==LC goto LogClear
if %M%==AJ goto ApplicationsJournal
if %M%==NJ goto NtfsJournal
if %M%==USB goto USB
if %M%==Menu goto menu
echo %c%Please enter a valid option.
timeout /t 1 /nobreak >nul
goto G

:: Cositasss

if %M%==Macro goto Macro
if %M%==Sites goto BlockedSites
if %M%==Record goto RecordingSoftwares
if %M%==Quit goto Destruct

:: Programas Manuales

:ProcessHacker2
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://github.com/processhacker/processhacker/releases/download/v2.39/processhacker-2.39-setup.exe','%appdata%\ChichoSSHelper\ProcessHacker2 Setup.exe')
"%appdata%\ChichoSSHelper\ProcessHacker2 Setup.exe"
goto A

:ProcessHollowing
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://chicho.wtf/downloads/PHDetection64.exe','%appdata%\ChichoSSHelper\PHDetection64.exe')
"%appdata%\ChichoSSHelper\PHDetection64.exe"
goto A

:ProcessHollowing
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://chicho.wtf/downloads/HPDetector.exe','%appdata%\ChichoSSHelper\HPDetector.exe')
"%appdata%\ChichoSSHelper\HPDetector.exe"
goto A

:ExecutedProgramFiles
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/executedprogramslist.zip','%appdata%\ChichoSSHelper\ExecutedProgramFiles.zip')
"%appdata%\ChichoSSHelper\ExecutedProgramFiles.zip"
goto A

:MUICacheView
cls
powershell (new-object System.Net.WebClient).DownloadFile('http://www.nirsoft.net/utils/muicacheview.zip','%appdata%\ChichoSSHelper\MUICacheView.zip')
"%appdata%\ChichoSSHelper\MUICacheView.zip"
goto A

:ShellBagsView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/shellbagsview.zip','%appdata%\ChichoSSHelper\ShellBagsView.zip')
"%appdata%\ChichoSSHelper\ShellBagsView.zip"
goto A

:BrowserDownloadView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/browserdownloadsview-x64.zip','%appdata%\ChichoSSHelper\BrowserDownloadView.zip')
"%appdata%\ChichoSSHelper\BrowserDownloadView.zip"
goto A

:BrowsingHistoryView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/browsinghistoryview-x64.zip','%appdata%\ChichoSSHelper\BrowsingHistoryView.zip')
"%appdata%\ChichoSSHelper\BrowsingHistoryView.zip"
goto A

:OpenSaveFilesView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/opensavefilesview-x64.zip','%appdata%\ChichoSSHelper\OpenSaveFilesView.zip')
"%appdata%\ChichoSSHelper\OpenSaveFilesView.zip"
goto A

:RecentFilesView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/recentfilesview.zip','%appdata%\ChichoSSHelper\RecentFilesView.zip')
"%appdata%\ChichoSSHelper\RecentFilesView.zip"
goto A

:LoadedDLLView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/loadeddllsview-x64.zip','%appdata%\ChichoSSHelper\LoadedDLLView.zip')
"%appdata%\ChichoSSHelper\LoadedDLLView.zip"
goto A

:LastActivityView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/lastactivityview.zip','%appdata%\ChichoSSHelper\LastActivityView.zip')
"%appdata%\ChichoSSHelper\LastActivityView.zip"
goto A

:WinPrefetchView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/winprefetchview-x64.zip','%appdata%\ChichoSSHelper\WinPrefetchView.zip')
"%appdata%\ChichoSSHelper\WinPrefetchView.zip"
goto A

:Luyten
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://github.com/deathmarine/Luyten/releases/download/v0.5.4_Rebuilt_with_Latest_depenencies/luyten-0.5.4.exe','%appdata%\ChichoSSHelper\Luyten.exe')
"%appdata%\ChichoSSHelper\Luyten.exe"
goto A

:Everything
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.voidtools.com/Everything-1.4.1.1005.x64.zip','%appdata%\ChichoSSHelper\Everything.zip')
"%appdata%\ChichoSSHelper\Everything.zip"
goto A

:AlternateStreamView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/alternatestreamview-x64.zip','%appdata%\ChichoSSHelper\AlternateStreamView.zip')
"%appdata%\ChichoSSHelper\AlternateStreamView.zip"
goto A

:PreviousFilesRecovery
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/previousfilesrecovery-x64.zip','%appdata%\ChichoSSHelper\PreviousFilesRecovery.zip')
"%appdata%\ChichoSSHelper\PreviousFilesRecovery.zip"
goto A

:RegScanner
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/regscanner-x64.zip','%appdata%\ChichoSSHelper\RegScanner.zip')
"%appdata%\ChichoSSHelper\RegScanner.zip"
goto A

:USBDeview
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/usbdeview-x64.zip','%appdata%\ChichoSSHelper\USBDeview.zip')
"%appdata%\ChichoSSHelper\USBDeview.zip"
goto A

:USBDeview
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/usbdeview-x64.zip','%appdata%\ChichoSSHelper\USBDeview.zip')
"%appdata%\ChichoSSHelper\USBDeview.zip"
goto A

:HistoryViewer
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://chicho.wtf/downloads/hvsetup.exe','%appdata%\ChichoSSHelper\hvsetup.exe')
"%appdata%\ChichoSSHelper\hvsetup.exe"
goto A

:CachedProgramList
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://github.com/ponei/CachedProgramsList/releases/download/1.1/CachedProgramsList.exe','%appdata%\ChichoSSHelper\CachedProgramsList.exe')
"%appdata%\ChichoSSHelper\CachedProgramsList.exe"
goto A

:WizFile
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://antibody-software.com/files/wizfile_3_07_setup.exe','%appdata%\ChichoSSHelper\wizfile_3_07_setup.exe')
"%appdata%\ChichoSSHelper\wizfile_3_07_setup.exe"
goto A

:PcaSvcFileExplorer
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://github.com/Zack-src/Service-Execution/releases/download/1.0/PcaSvc.FileExplorer.exe','%appdata%\ChichoSSHelper\PcaSvc.FileExplorer.exe')
"%appdata%\ChichoSSHelper\PcaSvc.FileExplorer.exe"
goto A

:DREFiles
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.mediafire.com/file/cogndrb22bymvqg/DRE-Files.exe/file','%appdata%\ChichoSSHelper\DRE-Files.exe')
"%appdata%\ChichoSSHelper\DRE-Files.exe"
goto A

:NetworkUsageView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/networkusageview-x64.zip','%appdata%\ChichoSSHelper\networkusageview-x64.zip')
"%appdata%\ChichoSSHelper\networkusageview-x64.zip"
goto A

:MyLastSearch
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/mylastsearch.zip','%appdata%\ChichoSSHelper\mylastsearch.zip')
"%appdata%\ChichoSSHelper\mylastsearch.zip"
goto A

:USBDriveLog
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/usbdrivelog.zip','%appdata%\ChichoSSHelper\usbdrivelog.zip')
"%appdata%\ChichoSSHelper\usbdrivelog.zip"
goto A

:WinDefTreathsView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/windefthreatsview-x64.zip','%appdata%\ChichoSSHelper\windefthreatsview-x64.zip')
"%appdata%\ChichoSSHelper\windefthreatsview-x64.zip"
goto A

:KeyBoardStateView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/keyboardstateview.zip','%appdata%\ChichoSSHelper\keyboardstateview.zip')
"%appdata%\ChichoSSHelper\keyboardstateview.zip"
goto A

:JumpListView
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/jumplistsview.zip','%appdata%\ChichoSSHelper\jumplistsview.zip')
"%appdata%\ChichoSSHelper\jumplistsview.zip"
goto A

:AlternateDataSteam
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/alternatestreamview-x64.zip','%appdata%\ChichoSSHelper\alternatestreamview-x64.zip')
"%appdata%\ChichoSSHelper\alternatestreamview-x64.zip"
goto A

:JournalTrace
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://github.com/ponei/JournalTrace/releases/download/1.0/JournalTrace.exe','%appdata%\ChichoSSHelper\JournalTrace.exe')
"%appdata%\ChichoSSHelper\JournalTrace.exe"
goto A

:: Programas Para recuperar cosas

:Clever
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://win.cleverfiles.com/disk-drill-win.exe','%appdata%\ChichoSSHelper\CleverRecoverFiles.exe')
"%appdata%\ChichoSSHelper\CleverRecoverFiles.exe"
goto B

:Previous
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.nirsoft.net/utils/previousfilesrecovery-x64.zip','%appdata%\ChichoSSHelper\PreviousFilesRecovery.zip')
"%appdata%\ChichoSSHelper\PreviousFilesRecovery.zip"
goto B

:EaseUS
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://down.easeus.com/product/drw_trial?ref=%2Fdatarecoverywizardpro%2F','%appdata%\ChichoSSHelper\EaseUS.exe')
"%appdata%\ChichoSSHelper\EaseUS.exe"
goto B

:Recuva
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://download.ccleaner.com/rcsetup153.exe','%appdata%\ChichoSSHelper\Recuva.exe')
"%appdata%\ChichoSSHelper\Recuva.exe"
goto B

:Glarysoft
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://www.glarysoft.com/aff/download.php?s=FRR','%appdata%\ChichoSSHelper\Glarysoft.exe')
"%appdata%\ChichoSSHelper\Glarysoft.exe"
goto B

:KickAss
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://sourceforge.net/projects/kickassundelete/files/Kickass%20Undelete%201.5.5/KickassUndelete_1.5.5.exe/download','%appdata%\ChichoSSHelper\KickAss.exe')
"%appdata%\ChichoSSHelper\KickAss.exe"
:Hetman
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://hetmanrecovery.com/download/hetman_uneraser.exe','%appdata%\ChichoSSHelper\hetman_uneraser.exe')
"%appdata%\ChichoSSHelper\hetman_uneraser.exe"
goto B

:Remo
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://remocdn1.azureedge.net/remosoftware/remo-recover-windows.exe','%appdata%\ChichoSSHelper\remo-recover-windows.exe')
"%appdata%\ChichoSSHelper\remo-recover-windows.exe"
goto B

:: Programas Automaticos

:Echo
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://dl.echo.ac/','%appdata%\ChichoSSHelper\Echo.exe')
"%appdata%\ChichoSSHelper\Echo.exe"
goto C

:Paladin
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://dl.paladin.ac/','%appdata%\ChichoSSHelper\Paladin.exe')
"%appdata%\ChichoSSHelper\Paladin.exe"
goto C

:SMT
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://cdn.discordapp.com/attachments/832255116051742763/832256347197800509/SMT.exe','%appdata%\ChichoSSHelper\SMT.exe')
"%appdata%\ChichoSSHelper\SMT.exe"
goto C

:Actova
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://dl.actova.ac/','%appdata%\ChichoSSHelper\Actova.exe')
"%appdata%\ChichoSSHelper\Actova.exe"
goto C

:Avenge
cls
powershell (new-object System.Net.WebClient).DownloadFile('https://dl.avenge.ac/','%appdata%\ChichoSSHelper\Avenge.exe')
"%appdata%\ChichoSSHelper\Avenge.exe"
goto C

:: Explorer

:Temp
cls
explorer "%temp%"
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto D

:Prefetch
cls
explorer "C:\Windows\prefetch"
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto D

:Puntominecraft
cls
explorer "%appdata%\.minecraft"
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto D

:Recycle
cls
start "" "C:\$Recycle.bin"
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto D

:BackgroundP
cls
explorer.exe shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto D

:Recent
cls
start Shell:Recent
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto D

:: USN journal

:journalDeletedFiles
cls
fsutil usn readjournal c: csv | findstr /i /C:"0x80000200" | findstr /i /C:.exe\^" /i /C:.py\^" /i /C:.jar\^" /i /C:.dll\^" /i /C:.com\^" /i /C:.pif\^" /i /C:.txt\^" /i /C:.jpg\^" /i /C:.jpeg\^" /i /C:.png\^" /i /C:.lnk\^" /i /C:.mp3\^" /i /C:.mp4\^" /i /C:.mkv\^" /i /C:.avi\^" /i /C:.ico\^" /i /C:.bat\^" /i /C:.cmd\^" /i /C:.reg\^" /i /C:.zip\^" /i /C:.rar\^" /i /C:.7z\^" /i /C:.ini\^" /i /C:.html\^" /i /C:.ppt\^" /i /C:.docx\^" /i /C:.xlsx\^" /i /C:.chm\^" /i /C:.aspx\^" /i /C:.app\^" /i /C:? > %appdata%\ChichoSSHelper\deletedfiles.txt
"%appdata%\ChichoSSHelper\deletedfiles.txt"
goto E

:journalRenamedFiles
cls
fsutil usn readjournal c: csv | findstr /i /C:"0x00002000" /i /C:"0x00001000" | findstr /i /C:.exe\^" /i /C:.py\^" /i /C:.jar\^" /i /C:.dll\^" /i /C:.com\^" /i /C:.pif\^" /i /C:.txt\^" /i /C:.jpg\^" /i /C:.jpeg\^" /i /C:.png\^" /i /C:.lnk\^" /i /C:.mp3\^" /i /C:.mp4\^" /i /C:.mkv\^" /i /C:.avi\^" /i /C:.ico\^" /i /C:.bat\^" /i /C:.cmd\^" /i /C:.reg\^" /i /C:.zip\^" /i /C:.rar\^" /i /C:.7z\^" /i /C:.ini\^" /i /C:.html\^" /i /C:.ppt\^" /i /C:.docx\^" /i /C:.xlsx\^" /i /C:.chm\^" /i /C:.aspx\^" /i /C:.app\^" /i /C:? > %appdata%\ChichoSSHelper\renamedfiles.txt
"%appdata%\ChichoSSHelper\renamedfiles.txt"
goto E

:journalFileType
cls
fsutil usn readJournal c: csv | findstr /i /C:"0x00002020" /i /C:"0x00000020" /i /C:"0x00200000" | findstr /i /C:"0x80008000" /i /C:"0x00008006" /i /C:"0x80200120" | findstr /i /C:.exe\^" /i /C:.py\^" /i /C:.jar\^" /i /C:.dll\^" /i /C:.com\^" /i /C:.pif\^" /i /C:.txt\^" /i /C:.jpg\^" /i /C:.jpeg\^" /i /C:.png\^" /i /C:.lnk\^" /i /C:.mp3\^" /i /C:.mp4\^" /i /C:.mkv\^" /i /C:.avi\^" /i /C:.ico\^" /i /C:.bat\^" /i /C:.cmd\^" /i /C:.reg\^" /i /C:.zip\^" /i /C:.rar\^" /i /C:.7z\^" /i /C:.ini\^" /i /C:.html\^" /i /C:.ppt\^" /i /C:.docx\^" /i /C:.xlsx\^" /i /C:.chm\^" /i /C:.aspx\^" /i /C:.app\^" /i /C:? > %appdata%\ChichoSSHelper\type.txt
"%appdata%\ChichoSSHelper\type.txt"
goto E

:journalFileStream
cls
fsutil usn readJournal c: csv | findstr /I /C:"0x00200120" > %appdata%\ChichoSSHelper\streams.txt
"%appdata%\ChichoSSHelper\streams.txt"
goto E

:journalExplorerRestart
cls
fsutil usn readJournal c: csv | findstr /i /C:0x00000100 | findstr /i /C:explorer | findstr /i /C:.pf\^" > %appdata%\ChichoSSHelper\restartexplorer.txt
"%appdata%\ChichoSSHelper\restartexplorer.txt"
goto E

:journalJarcache
cls
fsutil usn readJournal c: csv | findstr /i /C:"0x00000004" /i /C:"0x00000102" | findstr /i /C:"jar_cache" /i /C:".timestamp" > %appdata%\ChichoSSHelper\jarcache.txt
"%appdata%\ChichoSSHelper\jarcache.txt"
goto E

:journalSecurityChanges
cls
fsutil usn readjournal c: csv | findstr /i /C:"0x00000800" | findstr /i /C:.exe\^" /i /C:Prefetch > %appdata%\ChichoSSHelper\securitychanges.txt
"%appdata%\ChichoSSHelper\securitychanges.txt"
goto E

:: CMD Y Powershell

:MMAgent
cls
powershell "MMAgent"
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:NtfsLogsState
cls
powershell "Get-WinEvent -ListLog Microsoft-Windows-Ntfs/Operational | Format-List *" | findstr IsEnabled
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:QueryDPS
cls
sc query dps
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:QueryPcaSvc
cls
sc query PcaSvc
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:QueryEventlog
cls
sc query Eventlog
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:QuerySysMain
cls
sc query sysmain
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:QueryDiagTrack
cls
sc query diagtrack
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:QueryAppInfo
cls
sc query appinfo
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:TaskList
cls
tasklist
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:ConsoleHost
cls
explorer %userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:ShadowsCopies
cls
vssadmin list shadows
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:IpConfig
cls
ipconfig /displaydns
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:Tree
cls
tree
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto F

:: Regedit

:ExecutableFilesRan
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings" /f
start regedit
echo Done
goto G

:DisallowRun
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f
start regedit
echo Done
goto G

:MuiCache
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f
start regedit
echo Done
goto G

:UserAssist
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
start regedit
echo Done
goto G

:ArcHistory
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\WinRAR\ArcHistory" /f
start regedit
echo Done
goto G

:AppSwitched
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /f
start regedit
echo Done
goto G

:FileTypeAssociations
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts" /f
start regedit
echo Done
goto G

:OpenSaveDialogBox
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
start regedit
echo Done
goto G

:PrefetchParameters
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /f
start regedit
echo Done
goto G

:MountedVolumes
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\MountedDevices" /f
start regedit
echo Done
goto G

:ExecutedPrograms
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f
start regedit
echo Done
goto G

:OpenWhitelist
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.dll\OpenWithList" /f
start regedit
echo Done
goto G

:RecentDocs
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
start regedit
echo Done
goto G

:ShowJumpView
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView" /f
start regedit
echo Done
goto G

:LastVisitedPidlMRU
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /f
start regedit
echo Done
goto G

:Environment
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f
start regedit
echo Done
goto G

:FirewallRules
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /f
start regedit
echo Done
goto G

:Uninstall
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall" /f
start regedit
echo Done
goto G

:PropertyStore
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\LowRegistry\Audio\PolicyConfig\PropertyStore" /f
start regedit
echo Done
goto G

:DirectInput
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectInput" /f
start regedit
echo Done
goto G

:SetFileDate
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\NoNonsense\SetFileDate" /f
start regedit
echo Done
goto G

:CIDsizeMRU
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\CIDSizeMRU" /f
start regedit
echo Done
goto G

:TypedPaths
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f
start regedit
echo Done
goto G

:StartMenuInternet
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet" /f
start regedit
echo Done
goto G

:CommandProcessor
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor" /f
start regedit
echo Done
goto G

:VolumeInfoCache
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\VolumeInfoCache" /f
start regedit
echo Done
goto G

:HKIDS
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\AMD\HKIDs" /f
start regedit
echo Done
goto G

:USBStorage
cls
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR" /f
start regedit
echo Done
goto G

:: EventViewer

:TimeChange
cls
powershell Get-EventLog -LogName Security -InstanceId 4616
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto H

:UserChange
cls
powershell Get-EventLog -LogName Security -InstanceId 4634
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto H

:EventEnd
cls
powershell Get-EventLog -LogName Security -InstanceId 1100
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto H

:LogoutSession
cls
powershell Get-EventLog -LogName Security -InstanceId 4647
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto H

:LoginSession
cls
powershell Get-EventLog -LogName Security -InstanceId 4624
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto H

:LogClear
cls
powershell Get-EventLog -LogName Security -InstanceId 1102
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto H

:ApplicationsJournal
cls
powershell Get-EventLog -LogName Application -InstanceId 3079
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto H

:NtfsJournal
cls
powershell Get-WinEvent Microsoft-Windows-Ntfs/Operational | findstr 501
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto H

:USB
cls
powershell Get-WinEvent Microsoft-Windows-Kernel-PnP/Configuration | findstr 410
echo %c%Press %u%ENTER %c%to return to the menu
pause >nul
goto H

:: Macros

:Macro
cls
if exist "%localappdata%\Logitech\Logitech Gaming Software" (
explorer "%localappdata%\Logitech\Logitech Gaming Software"
) else (
echo %c%Logitech Gaming Software not found
)

if exist "%localappdata%\LGHUB" (
explorer "%localappdata%\LGHUB"
) else (
echo %c%LGHUB not found
)

if exist "%programdata%\Razer\Synapse\Accounts" (
explorer "%programdata%\Razer\Synapse\Accounts"
) else (
echo %c%Razer Synapse not found
)

if exist "%localappdata%\Razer\Synapse3\Settings" (
explorer "%localappdata%\Razer\Synapse3\Settings"
) else (
echo %c%Razer Synapse 3 not found
)

if exist "%programdata%\Razer\Razer Central\Accounts" (
explorer "%programdata%\Razer\Razer Central\Accounts"
) else (
echo %c%Razer not found
)

if exist "%appdata%\Corsair\Cue" (
explorer "%appdata%\Corsair\Cue"
) else (
echo %c%Corsair not found
)

if exist "%localappdata%\BY-COMBO2" (
explorer "%localappdata%\BY-COMBO2"
) else (
echo %c%Glorious not found
)

if exist "%localappdata%\JM01" (
explorer "%localappdata%\JM01"
) else (
echo %c%Aukey not found
)

if exist "C:\Program Files (x86)\Bloody7\Bloody7\Data\Mouse" (
explorer "C:\Program Files (x86)\Bloody7\Bloody7\Data\Mouse"
) else (
echo %c%Bloody7 not found
)

if exist "C:\Program Files (x86)\Bloody7\Bloody7\UserLog\Mouse\TLcir_9EFF3FF4" (
explorer "C:\Program Files (x86)\Bloody7\Bloody7\UserLog\Mouse\TLcir_9EFF3FF4"
) else (
echo %c%Bloody7 Check 2 not found
)

if exist "C:\Users\%username%\AppData\Roaming\REDRAGON\GamingMouse" (
explorer "C:\Users\%username%\AppData\Roaming\REDRAGON\GamingMouse"
) else (
echo %c%Redragon not found
)

if exist "C:\Users\%USERNAME%\Documents\M711 Gaming Mouse" (
explorer "C:\Users\%USERNAME%\Documents\M711 Gaming Mouse"
) else (
echo %c%Redragon M711 not found
)

if exist "C:\Program Files (x86)\Xenon200\" (
explorer "C:\Program Files (x86)\Xenon200\"
) else (
echo %c%Xenon200 not found
)

if exist "C:\ProgramData\CoolerMaster\PORTAL\config\" (
explorer "C:\ProgramData\CoolerMaster\PORTAL\config\"
) else (
echo %c%CoolerMaster not found
)

if exist "C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Session Storage\" (
explorer "C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Session Storage\"
) else (
echo %c%SteelSeries not found
)

if exist "C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Local Storage\leveldb\" (
explorer "C:\Users\%username%\AppData\Roaming\steelseries-engine-3-client\Local Storage\leveldb\"
) else (
echo %c%SteelSeries Check 2 not found
)

if exist "C:\ProgramData\Alienware\AlienWare Command Center\fxmetadata" (
explorer "C:\ProgramData\Alienware\AlienWare Command Center\fxmetadata"
) else (
echo %c%Alienware not found
)

if exist "C:\Users\%username%\AppData\Roaming\ROCCAT\SWARM\" (
explorer "C:\Users\%username%\AppData\Roaming\ROCCAT\SWARM\"
) else (
echo %c%Roccat not found
)

if exist "C:\Program Files\Gaming MouseV30" (
explorer "C:\Program Files\Gaming MouseV30"
) else (
echo %c%MotorSpeed not found
)

if exist "C:\Program Files (x86)\Gaming Mouse\Config" (
explorer "C:\Program Files (x86)\Gaming Mouse\Config"
) else (
echo %c%MarsGaming not found
)

if exist "C:\Users\%username%\AppData\Local\BY-8801-GM917-v108" (
explorer "C:\Users\%username%\AppData\Local\BY-8801-GM917-v108"
) else (
echo %c%Marvo not found
)

if exist "C:\Program Files\AYAX GamingMouse" (
explorer "C:\Program Files\AYAX GamingMouse"
) else (
echo %c%Ayax not found
)

if exist "C:\Blackweb Gaming AP\config" (
explorer "C:\Blackweb Gaming AP\config"
) else (
echo %c%Blackweb not found
)

if exist "C:\Program Files (x86)\SPC Gear" (
explorer "C:\Program Files (x86)\SPC Gear"
) else (
echo %c%Lix not found
)
ping localhost -n 5 >nul
goto menu

:: Programas de Grabacion

:RecordingSoftwares
cls
:recording
tasklist /fi "ImageName eq nvcontainer.exe" /fo csv 2>nul | find /I "nvcontainer" >nul
if %errorlevel%==1 goto obs
if %errorlevel%==0 echo %c%Shadowplay could be recording, Would you like to close it? (Yes, No) 
set /p term=
if /i %term%==Yes (taskkill /f /im nvcontainer.exe /t >nul & set %term%=e & goto obs) else (goto obs)

:obs
tasklist /fi "ImageName eq obs64.exe" /fo csv 2>nul | find /I "obs64" >nul
if %errorlevel%==1 goto bdcam
if %errorlevel%==0 echo %c%OBS could be recording, Would you like to close it? (Yes, No)
set /p term=
if /i %term%==Yes (taskkill /f /im obs64.exe /t >nul & set %term%=e & goto bdcam) else (goto bdcam)

:bdcam
tasklist /fi "ImageName eq bdcam.exe" /fo csv 2>nul | find /I "bdcam" >nul
if %errorlevel%==1 goto radeon
if %errorlevel%==0 echo %c%Bandicam could be recording, Would you like to close it? (Yes, No)
set /p term=
if /i %term%==Yes (taskkill /f /im bdcam.exe /t >nul & set %term%=e & goto radeon) else (goto radeon)

:radeon
tasklist /fi "ImageName eq RadeonSettings.exe" /fo csv 2>nul | find /I "RadeonSettings" >nul
if %errorlevel%==1 goto action
if %errorlevel%==0 echo %c%Randeon could be recording, Would you like to close it? (Yes, No)
set /p term=
if /i %term%==Yes (taskkill /f /im RadeonSettings.exe /t >nul & set %term%=e & goto fraps) else (goto fraps)

:fraps
tasklist /fi "ImageName eq Fraps.exe" /fo csv 2>nul | find /I "Fraps" >nul
if %errorlevel%==1 goto camrecorder
if %errorlevel%==0 echo %c%Fraps could be recording, Would you like to close it? (Yes, No)
set /p term=
if /i %term%==Yes (taskkill /f /im Fraps.exe /t >nul & set %term%=e & goto camrecorder) else (goto camrecorder)

:camrecorder
tasklist /fi "ImageName eq CamRecorder.exe" /fo csv 2>nul | find /I "CamRecorder" >nul
if %errorlevel%==1 goto xcore
if %errorlevel%==0 echo %c%CamRecorder could be recording, Would you like to close it? (Yes, No)
set /p term=
if /i %term%==Yes (taskkill /f /im CamRecorder.exe /t >nul & set %term%=e & goto xcore) else (goto xcore)

:xcore
tasklist /fi "ImageName eq XSplit.Core.exe" /fo csv 2>nul | find /I "XSplit.Core" >nul
if %errorlevel%==1 goto action
if %errorlevel%==0 echo %c%XSplit Core could be recording, Would you like to close it? (Yes, No)
set /p term=
if /i %term%==Yes (taskkill /f /im XSplit.Core.exe /t >nul & set %term%=e & goto action) else (goto action)

:action
tasklist /fi "ImageName eq Action.exe" /fo csv 2>nul | find /I "Action" >nul
if %errorlevel%==1 goto vpn
if %errorlevel%==0 echo %c%Action could be recording, Would you like to close it? (Yes, No)
set /p term=
if /i %term%==Yes (taskkill /f /im Action.exe /t >nul & set %term%=e & taskkill /f /im action_svc.exe /t >nul goto vpn) else (goto vpn)

:vpn
tasklist /fi "ImageName eq Windscribe.exe" /fo csv 2>nul | find /I "Windscribe" >nul
if %errorlevel%==1 goto pia
if %errorlevel%==0 echo %c%Windscribe VPN is running, continue to SS? (Yes, No)
set /p vpn=
if /i %vpn%==Yes (goto menu) else (exit)

:pia
tasklist /fi "ImageName eq pia-client.exe" /fo csv 2>nul | find /I "pia-client" >nul
if %errorlevel%==1 goto ipvanish
if %errorlevel%==0 echo %c%PIA VPN is running, continue to SS? (Yes, No)
set /p vpn=
if /i %vpn%==Yes (goto menu) else (exit)

:ipvanish
tasklist /fi "ImageName eq IPVanish.exe" /fo csv 2>nul | find /I "IPVanish" >nul
if %errorlevel%==1 goto menu
if %errorlevel%==0 echo %c%IPVanish VPN is running, continue to SS? (Yes, No)
set /p vpn=
if /i %vpn%==Yes (goto menu) else (exit)

:: Paginas bloqueadas

:BlockedSites
notepad "C:\Windows\System32\Drivers\etc\Hosts"
goto menu

:: Borrar

:Destruct
title Thanks for using Chicho SS Helper!
mode 42,5
cls
echo.            
echo %u%Created by: %c%Chicho#7585
echo %u%Github: %c%https://github.com/Gastxn
echo %u%Version: %c%1.5
timeout /t 7 >nul
cls
rmdir /s /q %appdata%\ChichoSSHelper
exit