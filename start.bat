@echo off
cd "C:\1SteamCMD\steamapps\common\DayZ Server Exp"
:loop
start "" /high /wait "DayZServer_x64.exe" -config=serverDZ.cfg -port=2302 -limitFPS=100
goto loop