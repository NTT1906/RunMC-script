@echo on
rem tasklist /svc | findstr /i "php.exe"
wmic process get processid,parentprocessid,name | find "php.exe"

rem for /f "tokens=2" %%i in ('wmic process get processid^,parentprocessid^,executablepath ^| find "php.exe"') do (
rem set PHP_PID=
rem for /f "tokens=2-3" %%A in ('wmic process get processid^,parentprocessid^,name ^| find "php.exe"') do (
rem	if NOT (%PHP_PID%NOT %%B == %A% AND "%PHP_BINARY%"=="" (
rem 		set PHP_PID=%%A
rem 	)
rem )
rem echo %PHP_PID%

rem set PID=
rem for /f "tokens=3" %%i in ('tasklist /apps ^| findstr /i "RuntimeBroker.exe" ^| findstr /i "Microsoft.MinecraftUWP"') do (
rem 	set PID=%%i
rem )
rem echo %PID%

rem FOR /F "tokens=1-5" %%A IN ("This is a short sentence") DO @echo %%A %%B %%D
rem FOR /L %%parameter IN (1,2,10) DO @echo %%parameter

set CPID=
set SPID=
for /f "tokens=2-3" %%A in ('wmic process get processid^,parentprocessid^,name ^| find "php.exe"') do (
	if CPID == %%A (
		set PHP_PID=%%B
		set SOURCE_PID=%%A
		goto :continue
	)
	set CPID=%%B
	set SPID=%%A
	echo %%A : %%B : %CPID% : %SPID%
)
:continue
echo %CPID% : %SPID% : %PHP_PID%

openfiles /query /fo table | find /I ""$FileOrFolderPath""



C:\Users\nttis\Downloads\PocketMine-MP>wmic process list full |find "php.exe"
CommandLine=bin\php\php.exe  PocketMine-MP.phar
Description=php.exe
ExecutablePath=C:\Users\nttis\Downloads\PocketMine-MP\bin\php\php.exe
Name=php.exe
CommandLine="C:\Users\nttis\Downloads\PocketMine-MP\bin\php\php.exe" "-dopcache.enable_cli=0" "-r" "require base64_decode(\"cGhhcjovL0M6L1VzZXJzL250dGlzL0Rvd25sb2Fkcy9Qb2NrZXRNaW5lLU1QL1BvY2tldE1pbmUtTVAucGhhci9zcmMvY29uc29sZS9Db25zb2xlUmVhZGVyQ2hpbGRQcm9jZXNzLnBocA==\", true);" "127.0.0.1:56608"
Description=php.exe
ExecutablePath=C:\Users\nttis\Downloads\PocketMine-MP\bin\php\php.exe
Name=php.exe
CommandLine=find  "php.exe"

C:\Users\nttis\Downloads\PocketMine-MP>
