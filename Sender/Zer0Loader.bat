@echo off
title [Zer0Loader] - Sender
color 0F
mode con: cols=60 lines=25
chcp 65001 >nul
timeout /t 1 >nul

:log
set log=Zer0Loader.log
type nul > %log%
echo ==================================================================================== >> %log%
echo. >> %log%
echo  ███████╗███████╗██████╗  ██████╗ ██╗      ██████╗  █████╗ ██████╗ ███████╗██████╗ >> %log%
echo  ╚══███╔╝██╔════╝██╔══██╗██╔═████╗██║     ██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗ >> %log%
echo    ███╔╝ █████╗  ██████╔╝██║██╔██║██║     ██║   ██║███████║██║  ██║█████╗  ██████╔╝ >> %log%
echo   ███╔╝  ██╔══╝  ██╔══██╗████╔╝██║██║     ██║   ██║██╔══██║██║  ██║██╔══╝  ██╔══██╗ >> %log%
echo  ███████╗███████╗██║  ██║╚██████╔╝███████╗╚██████╔╝██║  ██║██████╔╝███████╗██║  ██║ >> %log%
echo  ╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝ >> %log%
echo. >> %log%
echo ==================================================================================== >> %log%
echo                               Zer0Loader :: v1.0 >> %log%
echo                       Developed and written by Kaldarix >> %log%
echo ==================================================================================== >> %log%
goto :checkforjava

:checkforjava
where java >> %log%
where java
if errorlevel 1 (
    powershell -Command "Write-Host '[Zer0Loader] Java not found.' -ForegroundColor Red"
	set /p javaInstall=[Zer0Loader] Do you want to install java now? [Y/N]:
	if /I "%javaInstall%"=="Y" goto javaInstall
	if /I "%javaInstall%"=="N" exit
	if /I "%javaInstall%"=="DEV" goto loadingscrn
	pause>nul
)
goto loadingscrn

:javaInstall
cls
echo [Zer0Loader] User does not have Java SE Development Kit installed. >> %log%
echo [Zer0Loader] Downloading JDK... >> %log%
set "jdk_url=https://download.oracle.com/java/24/latest/jdk-24_windows-x64_bin.exe"
set "jdk_file=%TEMP%\jdk_installer.exe"
powershell -Command "Invoke-WebRequest -Uri '%jdk_url%' -OutFile '%jdk_file%'"
if exist "%jdk_file%" (
    echo [Zer0Loader] JDK downloaded successfully. Running installer... >> %log%
	timeout /t 2
    "%jdk_file%"
) else (
    echo [Zer0Loader] JDK download failed. >> %log%
    powershell -Command "Write-Host '[Zer0Loader] Failed to download JDK installer.' -ForegroundColor Red"
	powershell -Command "Write-Host '[Zer0Loader] Opening browser"
	start "" "https://www.oracle.com/java/technologies/downloads/#jdk24-windows"
    timeout /t 5
	exit
)
goto checkforjava2

:checkforjava2
where java >> %log%
where java
if errorlevel 1 (
    powershell -Command "Write-Host '[Zer0Loader] Java still not found.' -ForegroundColor Red"
	echo [Zer0Loader] Java still not found. >> %log%
	timeout /t 5 >nul
	exit
)


:loadingscrn
cls
chcp 65001 >nul
echo.
echo ====================================================================================
echo.
echo  ███████╗███████╗██████╗  ██████╗ ██╗      ██████╗  █████╗ ██████╗ ███████╗██████╗ 
echo  ╚══███╔╝██╔════╝██╔══██╗██╔═████╗██║     ██╔═══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗
echo    ███╔╝ █████╗  ██████╔╝██║██╔██║██║     ██║   ██║███████║██║  ██║█████╗  ██████╔╝
echo   ███╔╝  ██╔══╝  ██╔══██╗████╔╝██║██║     ██║   ██║██╔══██║██║  ██║██╔══╝  ██╔══██╗
echo  ███████╗███████╗██║  ██║╚██████╔╝███████╗╚██████╔╝██║  ██║██████╔╝███████╗██║  ██║
echo  ╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
echo.
echo ====================================================================================
echo                               Zer0Loader :: v1.0
echo                       Developed and written by Kaldarix
echo ====================================================================================
timeout /t 2 >nul
start Zer0Panel.bat
