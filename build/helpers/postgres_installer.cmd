CALL %ROOT%\build\helpers\setvars.cmd

REM Required
REM 1. NSIS
REM 2. UsrMgr Plugin for NSIS
REM 3. AccessControl Plugin for NSIS
REM 4. Visual Studio 2010 Redistibutable (x86, x64) [Place it to nsis directory]
REM 5. PostgreSQL and PgAdmin3 binaries
REM 6. 7z for making ZIP files

REM Download VC Redistibutable packages
TITLE Downloading VC Redistibutable packages
MKDIR "c:\pg\vcredist"

wget -c https://download.microsoft.com/download/5/B/C/5BC5DBB3-652D-4DCE-B14A-475AB85EEF6E/vcredist_x86.exe -O "c:\pg\vcredist\vcredist_x86_2010.exe" || GOTO :ERROR
wget -c https://download.microsoft.com/download/3/2/2/3224B87F-CFA0-4E70-BDA3-3DE650EFEBA5/vcredist_x64.exe -O "c:\pg\vcredist\vcredist_x64_2010.exe" || GOTO :ERROR

REM Make directory for installers
MKDIR "c:\pg\installers"

TITLE Making NSIS installers
call %ROOT%\build\helpers\postgres_nsis_installer.cmd || GOTO :ERROR

GOTO :DONE

:ERROR
ECHO Failed with error #%errorlevel%.
PAUSE
EXIT /b %errorlevel%

:DONE
ECHO Done.
PAUSE
