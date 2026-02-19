@echo off
REM CourseLit Portable - Dependency Installer
REM Use this if "Module not found" errors occur.

setlocal enabledelayedexpansion

REM Set paths
set "NODE_PATH=%~dp0node-portable"
set "COURSELIT_PATH=%~dp0courselit-portable"

REM Check for internet
echo Checking internet connection...
ping google.com -n 1 -w 1000 >nul
if errorlevel 1 (
    echo.
    echo [WARNING] No internet connection detected.
    echo Installation requires internet access.
    echo Please connect and try again.
    pause
    exit /b
)

REM Add node to PATH
set PATH=%NODE_PATH%;%PATH%

REM Change to project root (Monorepo root)
cd /d "%COURSELIT_PATH%"

echo.
echo Installing dependencies using Portable pnpm...
echo This may take several minutes.
echo.

REM Run install
call "%NODE_PATH%\pnpm.cmd" install

if errorlevel 1 (
    echo.
    echo [ERROR] Installation failed.
    echo Check your internet connection or try again.
    pause
    exit /b
)

echo.
echo [SUCCESS] Dependencies installed!
echo You can now run START-COURSELIT.bat
pause
