@echo off
REM CourseLit Portable Launcher with MongoDB (Direct Next.js Mode)
REM Date: 2026

setlocal enabledelayedexpansion

REM Get current drive letter
for /f "tokens=1 delims=:" %%A in ("%~dp0.") do set "CURRENT_DRIVE=%%A:"

REM Set paths
set "COURSELIT_PATH=%~dp0courselit-portable"
set "NODE_PATH=%~dp0node-portable"
set "MONGODB_PATH=%~dp0mongodb-portable"
set "MONGODB_DATA=%~dp0mongodb-data"

REM Create data directory if not exists
if not exist "%MONGODB_DATA%" mkdir "%MONGODB_DATA%"

REM Set Node and Mongo in PATH
set PATH=%NODE_PATH%;%MONGODB_PATH%\bin;%PATH%

REM Change to Web App Folder
cd /d "%COURSELIT_PATH%\apps\web"

REM Create .env configuration (Manual overwrite to be safe)
(
    echo NODE_ENV=development
    echo HOSTNAME=0.0.0.0
    echo PORT=3002
    echo DB_CONNECTION_STRING=mongodb://localhost:27017/courselit
    echo MONGODB_URI=mongodb://localhost:27017/courselit
    echo API_URL=http://localhost:3000
    echo NEXT_PUBLIC_API_URL=http://localhost:3000
    echo NEXT_PUBLIC_WEB_URL=http://localhost:3002
    echo API_SECRET=courselit-secret-key-change-this
    echo SUPER_ADMIN_EMAIL=admin@example.com
) > .env

REM Start MongoDB in background
echo Starting MongoDB...
start "MongoDB" "%MONGODB_PATH%\bin\mongod.exe" --dbpath "%MONGODB_DATA%" --bind_ip 127.0.0.1 --logpath "%MONGODB_DATA%\mongo.log"

REM Wait for MongoDB to start
echo Waiting for MongoDB to result (Max 60s)...
:WAIT_MONGO
timeout /t 2 /nobreak >nul
netstat -an | find "27017" | find "LISTENING" >nul
if errorlevel 1 (
    echo [WAIT] Database sedang loading...
    goto WAIT_MONGO
)
echo [SUCCESS] MongoDB Ready!

REM Start CourseLit services
echo.
echo ========================================
echo    CourseLit Portable Starting...
echo ========================================
echo.
echo Services:
echo - MongoDB:     mongodb://localhost:27017
echo - Student Web: http://localhost:3002
echo.
echo [INFO] Using DIRECT Next.js Launch (Bypassing npm run scripts)
echo Press Ctrl+C to stop
echo.

REM Start Next.js directly using local node_modules
REM This avoids issues with 'npm run' on some Windows setups
echo Killing old processes to free up ports...
taskkill /F /IM node.exe /T >nul 2>&1
timeout /t 2 /nobreak >nul

echo Killing old processes...
taskkill /F /IM node.exe /T >nul 2>&1
timeout /t 3 /nobreak >nul

:CHECK_PORT
netstat -ano | find "3002" | find "LISTENING" >nul
if not errorlevel 1 (
    echo [WARNING] Port 3002 masih dipakai! Mencoba kill lagi...
    taskkill /F /IM node.exe /T >nul 2>&1
    timeout /t 2 /nobreak >nul
    goto CHECK_PORT
)

echo Port 3002 Free. Starting Next.js...
call "%NODE_PATH%\node.exe" "node_modules\next\dist\bin\next" dev -p 3002 -H 0.0.0.0

pause
