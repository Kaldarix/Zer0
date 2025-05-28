@echo off
title [Zer0Target] Listener Launcher
chcp 65001 >nul
setlocal EnableDelayedExpansion

where java >nul 2>&1
if errorlevel 1 (
    echo [Zer0Loader] Java not found. Install Java and try again.
    pause
    exit /b
)

netsh advfirewall firewall show rule name="Zer0Target Port 6666" | findstr /i "Rule Name" >nul
if errorlevel 1 (
    netsh advfirewall firewall add rule name="Zer0Target Port 6666" dir=in action=allow protocol=TCP localport=6666 >nul 2>&1
    if errorlevel 1 (
        powershell -Command "Write-Host '[Zer0Loader] Failed to add firewall rule.' -ForegroundColor Red"
        pause
        exit /b
    ) else (
        powershell -Command "Write-Host '[Zer0Loader] Firewall rule added: Port 6666 TCP open.' -ForegroundColor Green"
    )
) else (
    powershell -Command "Write-Host '[Zer0Loader] Firewall rule already exists.' -ForegroundColor Yellow"
)
goto ramdetection


:ramdetection
for /f "tokens=2 delims==" %%A in ('wmic computersystem get totalphysicalmemory /value ^| find "="') do set "totalMem=%%A
set /a totalMemMB=!totalMem:~0, -6!
set /a ramCap=!totalRamMB! * 90 /100

:listener
echo [Zer0Loader] Starting listener on port 6666...
javac -Xlint:deprecation Zer0Target.java
java -Xmx10G Zer0Target
pause>nul
