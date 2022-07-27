#!/usr/bin/env bash
DIR="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd "$DIR"
explorer "shell:appsFolder\Microsoft.MinecraftUWP_8wekyb3d8bbwe!App"
IFS=' ' read -r -a array <<< "`tasklist -apps | findstr -i "RuntimeBroker.exe" | findstr -i "Microsoft.MinecraftUWP"`"
echo "Wait until Minecraft started."
sleep 2
taskkill -pid "${array[2]}" -f
