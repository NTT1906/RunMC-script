@echo off
explorer shell:appsFolder\Microsoft.MinecraftUWP_8wekyb3d8bbwe!App
rem for /f "tokens=2,3*" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v "ServiceDll"') do if not defined ServiceDll set ServiceDll=%%b

rem if "%ServiceDll%" == "%%SystemRoot%%\System32\ClipSVC.dll" (
rem 	exit
rem )
echo "Wait until Minecraft started."
timeout 2
@echo off
for /f "tokens=3" %%i in ('tasklist /apps ^| findstr /i "RuntimeBroker.exe" ^| findstr /i "Microsoft.MinecraftUWP"') do (
	set PID=%%i
)
taskkill /pid %PID% /f
exit