@echo off
REM Stop all CourseLit services

echo Stopping CourseLit services...

REM Kill Node processes
taskkill /F /IM node.exe 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Stopped Node.js processes.
) else (
    echo No Node.js process found or access denied.
)

REM Kill MongoDB processes
taskkill /F /IM mongod.exe 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Stopped MongoDB processes.
) else (
    echo No MongoDB process found or access denied.
)

echo.
echo All services stopped.
pause
