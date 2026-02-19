@echo off
REM CourseLit Desktop Launcher (Electron)
setlocal enabledelayedexpansion

REM Set paths
set "NODE_PATH=%~dp0node-portable"
set "DESKTOP_PATH=%~dp0desktop-app"

REM Add node to PATH
set PATH=%NODE_PATH%;%PATH%

echo Starting CourseLit Desktop...

REM Run Electron
call "%NODE_PATH%\npm.cmd" start --prefix "%DESKTOP_PATH%"
