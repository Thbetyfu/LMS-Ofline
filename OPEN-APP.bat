@echo off
REM CourseLit - Open as App (Edge)
REM Version: Smart Wait

echo [INFO] Menunggu Server CourseLit siap...
echo (Jangan tutup jendela server yang berwarna hitam!)

:WAIT_LOOP
timeout /t 2 /nobreak >nul
netstat -an | find "3002" | find "LISTENING" >nul
if errorlevel 1 (
    echo [WAIT] Server belum siap... (Sedang loading)
    goto WAIT_LOOP
)

echo.
echo [SUCCESS] Server Ditemukan! Membuka Aplikasi...
start msedge --app=http://localhost:3002 --user-data-dir="%~dp0edge-profile" --no-first-run --no-default-browser-check

exit
