explorer shell:appsFolder\Microsoft.MinecraftUWP_8wekyb3d8bbwe!App

echo "Wait until Minecraft started."
Start-Sleep 2

$id  = ((tasklist /apps | findstr /i "RuntimeBroker.exe" | findstr /i "Microsoft.MinecraftUWP") -replace '\s+', ' ').split()[2]

taskkill /pid $id /f