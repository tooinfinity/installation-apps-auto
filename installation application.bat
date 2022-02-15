

@echo off
%~d0
CD %~dp0
setlocal EnableExtensions
@echo OFF

mode con:cols=80 lines=40

@echo off
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
@echo off

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT

:begin


:: Customize Window
title Installation Application With CMD By TOUWFIQ MEGHLAOUI 


:: Menu Options
:: Specify as many as you want, but they must be sequential from 1 with no gaps


:: Step 1. List the Application Names
set "App[1]=Enable Or disable Windows Defender"
set "App[2]=Install Winrar"
set "App[3]=Install VLC"
set "App[4]=Install Chrome"
set "App[5]=Install Firefox"
set "App[6]=Install Shareit"
set "App[7]=Install Telegram"
set "App[8]=Install Internet Download Manager"
set "App[9]=Install Adobe Reader"
set "App[10]=Install Office 2007"
set "App[11]=Install Office 2010"
set "App[12]=Install Office 2013"
set "App[13]=Install All Application with Office 2007"
set "App[14]=Install All Application with Office 2010"
set "App[15]=Install All Application with Office 2013"
set "App[16]=Activation Windows"
set "App[17]=Activation Internet Download Manager"




:: Display the Menu
set "Message="
:Menu
cls
echo.%Message%
echo.
echo.  Installation Application With CMD By TOUWFIQ MEGHLAOUI
echo.
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" echo.  Windows 10
if "%version%" == "6.3"  echo.  Windows 8.1
if "%version%" == "6.2"  echo.  Windows 8
if "%version%" == "6.1"  echo.  Windows 7
echo.
if %OS%==32BIT echo.  This is a 32bit operating system
if %OS%==64BIT echo.  This is a 64bit operating system
echo.
echo.
set "x=0"

:MenuLoop
set /a "x+=1"
if defined App[%x%] (
    call echo   %x%. %%App[%x%]%%
    goto MenuLoop
)
echo.

:: Prompt User for Choice
:Prompt
set "Input="
set /p "Input=Select what app:"

:: Validate Input [Remove Special Characters]
if not defined Input goto Prompt
set "Input=%Input:"=%"
set "Input=%Input:^=%"
set "Input=%Input:<=%"
set "Input=%Input:>=%"
set "Input=%Input:&=%"
set "Input=%Input:|=%"
set "Input=%Input:(=%"
set "Input=%Input:)=%"
:: Equals are not allowed in variable names
set "Input=%Input:^==%"
call :Validate %Input%

:: Process Input
call :Process %Input%
goto End


:Validate
set "Next=%2"
if not defined App[%1] (
    set "Message=Invalid Input: %1"
    goto Menu
)
if defined Next shift & goto Validate
goto :eof


:Process
set "Next=%2"
call set "App=%%App[%1]%%"

:: Run Installations
:: Specify all of the installations for each app.
:: Step 2. Match on the application names and perform the installation for each

if "%App%" EQU "Enable Or disable Windows Defender" (

  echo. Windows Defender Extract...
  echo.
  "C:\Program Files\7-Zip\7z.exe" x _apps\dcontrol\*.zip -p123 -o_apps\dcontrol\* 
  echo.
  echo. Windows Defender...
  start /wait _apps\dcontrol\defenderControl\dfControl.exe
  echo.
  pause
  echo.
  echo. delete Windows Defender ...
  rmdir /s /q _apps\dcontrol\defenderControl\
  echo.
  echo. Windows Defender completed
  echo. 
  pause
  echo.
  goto :begin
)

if "%App%" EQU "Install Winrar" (
  
  if %OS%==32BIT (
    echo Winrar32...
    start /wait _apps\winrar-x86-520.exe /S
  )
  

  if %OS%==64BIT (
    echo Winrar64...
    start /wait _apps\winrar-x64-520.exe /S
  )
  echo.
  echo. Install Winrar completed
  echo. 
  pause
  echo.
  goto :begin
)
if "%App%" EQU "Install VLC" (

  if %OS%==32BIT (
  echo VLC32...
  start /wait _apps\vlc-3.0.7.1-win32.exe /L=1036 /S
  )

  if %OS%==64BIT (
  echo VLC64...
  start /wait _apps\vlc-3.0.7.1-win64.exe /L=1036 /S
  )
  echo.
  echo. Install VLC completed
  echo. 
  pause
  echo.
  goto :begin
)
if "%App%" EQU "Install Chrome" (

  if %OS%==32BIT (
  echo chrome32...
  start /wait _apps\ChromeStandaloneSetup32.exe /silent /install
  )

  if %OS%==64BIT (
  echo chrome64...
  start /wait _apps\ChromeStandaloneSetup64.exe /silent /install
  )

  goto :begin
)
if "%App%" EQU "Install Firefox" (
  

  if %OS%==32BIT (
  echo Firefox32...
  start /wait _apps\Firefox_96.0.2_32_fr.exe /S
  )

  if %OS%==64BIT (
  echo Firefox64...
  start /wait _apps\Firefox_96.0.2_64_fr.exe /S
  )

  goto :begin
)
if "%App%" EQU "Install Shareit" (
  echo Shareit
  start /wait _apps\SHAREit-KCWEB.exe /VERYSILENT /NORESTART

  goto :begin
)
if "%App%" EQU "Install Telegram" (
  echo Telegram
  start /wait _apps\tsetup.3.4.8.exe /VERYSILENT /NORESTART

  goto :begin
)
if "%App%" EQU "Install Internet Download Manager" (
  echo Internet Download Manager
  start /wait _apps\idman640build5.exe /skipdlgs

  goto :begin
)
if "%App%" EQU "Install Adobe Reader" (
  echo Adobe
  start /wait _apps\AdbeRdr11006_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES

  goto :begin
)
if "%App%" EQU "Install Office 2007" (
  echo Office2007...
  start /wait _apps\office2007\setup.exe /adminfile InstallOffice2007.MSP

  goto :begin
)
if "%App%" EQU "Install Office 2010" (
  echo Office2010...
  start /wait _apps\office2010\setup.exe

  goto :begin
)
if "%App%" EQU "Install Office 2013" (
  echo Office2013...
  start /wait _apps\office2013\setup.exe

  goto :begin
)
if "%App%" EQU "Install All Application with Office 2007" (
  echo Installing Application...

  if %OS%==32BIT (

    echo Winrar32...
    start /wait _apps\winrar-x86-520.exe /S

    echo Installing 7Zip
    start /wait _apps\7z2107-x86.exe /S

    echo chrome32...
    start /wait _apps\ChromeStandaloneSetup32.exe /silent /install

    echo VLC32...
    start /wait _apps\vlc-3.0.7.1-win32.exe /L=1036 /S

    echo Firefox32...
    start /wait _apps\Firefox_96.0.2_32_fr.exe /S

    echo Shareit
    start /wait _apps\SHAREit-KCWEB.exe /VERYSILENT /NORESTART

    echo Telegram
    start /wait _apps\tsetup.3.4.8.exe /VERYSILENT /NORESTART

    echo Internet Download Manager
    start /wait _apps\idman640build5.exe /skipdlgs

    echo Adobe
    start /wait _apps\AdbeRdr11006_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES

    echo Office2007...
    start /wait _apps\office2007\setup.exe /adminfile InstallOffice2007.MSP
  )


  if %OS%==64BIT (

    echo Winrar64...
    start /wait _apps\winrar-x64-520.exe /S

    echo Installing 7Zip
    start /wait _apps\7z2107-x64.exe /S

    echo chrome64...
    start /wait _apps\ChromeStandaloneSetup64.exe /silent /install

    echo VLC64...
    start /wait _apps\vlc-3.0.7.1-win64.exe /L=1036 /S

    echo Firefox64...
    start /wait _apps\Firefox_96.0.2_64_fr.exe /S

    echo Shareit
    start /wait _apps\SHAREit-KCWEB.exe /VERYSILENT /NORESTART

    echo Telegram
    start /wait _apps\tsetup.3.4.8.exe /VERYSILENT /NORESTART

    echo Internet Download Manager
    start /wait _apps\idman640build5.exe /skipdlgs

    echo Adobe
    start /wait _apps\AdbeRdr11006_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES

    echo Office2007...
    start /wait _apps\office2007\setup.exe /adminfile InstallOffice2007.MSP
  )

  goto :begin
)
if "%App%" EQU "Install All Application with Office 2010" (
  echo Installing Application...

  if %OS%==32BIT (

    echo Winrar32...
    start /wait _apps\winrar-x86-520.exe /S

    echo Installing 7Zip
    start /wait _apps\7z2107-x86.exe /S

    echo chrome32...
    start /wait _apps\ChromeStandaloneSetup32.exe /silent /install

    echo VLC32...
    start /wait _apps\vlc-3.0.7.1-win32.exe /L=1036 /S

    echo Firefox32...
    start /wait _apps\Firefox_96.0.2_32_fr.exe /S

    echo Shareit
    start /wait _apps\SHAREit-KCWEB.exe /VERYSILENT /NORESTART

    echo Telegram
    start /wait _apps\tsetup.3.4.8.exe /VERYSILENT /NORESTART

    echo Internet Download Manager
    start /wait _apps\idman640build5.exe /skipdlgs

    echo Adobe
    start /wait _apps\AdbeRdr11006_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES

    echo Office2010...
    start /wait _apps\office2010\setup.exe
  )


  if %OS%==64BIT (

    echo Winrar64...
    start /wait _apps\winrar-x64-520.exe /S

    echo Installing 7Zip
    start /wait _apps\7z2107-x64.exe /S

    echo chrome64...
    start /wait _apps\ChromeStandaloneSetup64.exe /silent /install

    echo VLC64...
    start /wait _apps\vlc-3.0.7.1-win64.exe /L=1036 /S

    echo Firefox64...
    start /wait _apps\Firefox_96.0.2_64_fr.exe /S

    echo Shareit
    start /wait _apps\SHAREit-KCWEB.exe /VERYSILENT /NORESTART

    echo Telegram
    start /wait _apps\tsetup.3.4.8.exe /VERYSILENT /NORESTART

    echo Internet Download Manager
    start /wait _apps\idman640build5.exe /skipdlgs

    echo Adobe
    start /wait _apps\AdbeRdr11006_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES

    echo Office2010...
    start /wait _apps\office2010\setup.exe
  )

  goto :begin

)
if "%App%" EQU "Install All Application with Office 2013" (
  echo Installing Application...

  if %OS%==32BIT (

    echo Winrar32...
    start /wait _apps\winrar-x86-520.exe /S

    echo Installing 7Zip
    start /wait _apps\7z2107-x86.exe /S

    echo chrome32...
    start /wait _apps\ChromeStandaloneSetup32.exe /silent /install

    echo VLC32...
    start /wait _apps\vlc-3.0.7.1-win32.exe /L=1036 /S

    echo Firefox32...
    start /wait _apps\Firefox_96.0.2_32_fr.exe /S

    echo Shareit
    start /wait _apps\SHAREit-KCWEB.exe /VERYSILENT /NORESTART

    echo Telegram
    start /wait _apps\tsetup.3.4.8.exe /VERYSILENT /NORESTART

    echo Internet Download Manager
    start /wait _apps\idman640build5.exe /skipdlgs

    echo Adobe
    start /wait _apps\AdbeRdr11006_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES

    echo Office2013...
    start /wait _apps\office2013\setup.exe
  )


  if %OS%==64BIT (

    echo Winrar64...
    start /wait _apps\winrar-x64-520.exe /S

    echo Installing 7Zip
    start /wait _apps\7z2107-x64.exe /S

    echo chrome64...
    start /wait _apps\ChromeStandaloneSetup64.exe /silent /install

    echo VLC64...
    start /wait _apps\vlc-3.0.7.1-win64.exe /L=1036 /S

    echo Firefox64...
    start /wait _apps\Firefox_96.0.2_64_fr.exe /S

    echo Shareit
    start /wait _apps\SHAREit-KCWEB.exe /VERYSILENT /NORESTART

    echo Telegram
    start /wait _apps\tsetup.3.4.8.exe /VERYSILENT /NORESTART

    echo Internet Download Manager
    start /wait _apps\idman640build5.exe /skipdlgs

    echo Adobe
    start /wait _apps\AdbeRdr11006_en_US.exe /sAll /rs /msi EULA_ACCEPT=YES

    echo Office2013...
    start /wait _apps\office2013\setup.exe
  )

  goto :begin
)
if "%App%" EQU "Activation Windows" (
  
  echo Activation Windows Extract...
  
  "C:\Program Files\7-Zip\7z.exe" x _apps\activation-w10\*.zip -p123 -o_apps\activation-w10\* 

  echo Activation Window 10...
  start /wait _apps\activation-w10\KMSAuto\KMSAuto++.exe 

  echo.

  echo delete Activation Windows ...
  rmdir /s /q _apps\activation-w10\KMSAuto\

  echo.
  echo activation w10 completed 

  goto :begin

)
if "%App%" EQU "Activation Internet Download Manager" (
 
  
  echo IDM Patch Extract...

  "C:\Program Files\7-Zip\7z.exe" x _apps\idm\*.zip -p123 -o_apps\idm\* 

  echo IDM Patch...
  start /wait _apps\idm\Patch\Patch.exe 

  echo delete IDM Patch ...
  rmdir /s /q _apps\idm\Patch\

  echo.
  echo IDM Patch completed 

  goto :begin
)

:: Prevent the command from being processed twice if listed twice.
set "App[%1]="
if defined Next shift & goto Process
goto :eof


:End
endlocal
pause >nul
