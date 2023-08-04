wmic process get processid,parentprocessid,executablepath|find "7032"

wmic process where (ProcessId=6492) get Caption,ProcessId,ParentProcessID


wmic process get processid,parentprocessid,executablepath|find "process id goes here"

tasklist /svc | findstr /i "php.exe"

for /f "tokens=3" %%i in ('tasklist /apps ^| findstr /i "RuntimeBroker.exe" ^| findstr /i "Microsoft.MinecraftUWP"') do (
	set PID=%%i
)
taskkill /pid %PID% /f