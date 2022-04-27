@echo off
title jdmbone003's backup Tool
color AC
net session >nul 2>&1
    if %errorLevel% == 0 (
	goto strt
    ) else (
        echo Current permissions inadequate.
	echo Right click and Run as Administrator.
	pause
	exit
    )

:strt
cd /d "%~d0%"
mkdir "%computername%"
cd "%computername%"
mkdir "%username%"
cd "%username%"
:home
cls
echo %cd%
echo.
echo Above should not start with C:\
echo.
echo Select a task:
echo +============================+
echo ^| 1) Back up:Documents       ^|
echo ^| 2) Back up:Pictures        ^|
echo ^| 3) Back up:Music           ^|
echo ^| 4) Back up:Videos          ^|
echo ^| 5) Back up:Downloads       ^|
echo ^| 6) Back up:All             ^|
echo +============================+
echo ^| 8) Restore:Documents       ^|
echo ^| 9) Restore:Pictures        ^|
echo ^|10) Restore:Music           ^|
echo ^|11) Restore:Videos          ^|
echo ^|12) Restore:Downloads       ^|
echo ^|13) Restore:All             ^|
echo +============================+
echo ^| 0) Quit                    ^|
echo +============================+
set web=""
set /p web=Option:
if "%web%"=="" goto exit
if "%web%"=="0" goto exit
if "%web%"=="1" goto bdoc
if "%web%"=="2" goto bpic
if "%web%"=="3" goto bmus
if "%web%"=="4" goto bvid
if "%web%"=="5" goto bdnl
if "%web%"=="6" goto ball
if "%web%"=="7" goto rdoc
if "%web%"=="8" goto rpic
if "%web%"=="9" goto rmus
if "%web%"=="10" goto rvid
if "%web%"=="11" goto rdnl
if "%web%"=="12" goto rall
goto home

:bdoc
START "Backing up Documents" robocopy "C:\Users\%username%\Documents" "Documents" /S /COPYALL /XD "My Music" "My Pictures" "My Videos" /LOG:Documents_Backup_Log.txt /TEE /NP /ETA
START "Backing up Desktop" robocopy "C:\Users\%username%\Desktop" "Desktop" /S /COPYALL /LOG:Desktop_Backup_Log.txt /TEE /NP /ETA
goto home

:bpic
START "Backing up Pictures" robocopy "C:\Users\%username%\Pictures" "Pictures" /S /COPYALL /LOG:Pictures_Backup_Log.txt /TEE /NP /ETA
goto home

:bmus
START "Backing up Music" robocopy "C:\Users\%username%\Music" "Music" /S /COPYALL /XD "iTunes" /LOG:Music_Backup_Log.txt /TEE /NP /ETA
goto home

:bvid
START "Backing up Videos" robocopy "C:\Users\%username%\Videos" "Videos" /S /COPYALL /LOG:Videos_Backup_Log.txt /TEE /NP /ETA
goto home

:bdnl
START "Backing up Downloads" robocopy "C:\Users\%username%\Downloads" "Downloads" /S /COPYALL /LOG:Downloads_Backup_Log.txt /TEE /NP /ETA
goto home

:ball
START "Backing up Documents" robocopy "C:\Users\%username%\Documents" "Documents" /S /COPYALL /XD "My Music" "My Pictures" "My Videos" /LOG:Documents_Backup_Log.txt /TEE /NP /ETA
START "Backing up Desktop" robocopy "C:\Users\%username%\Desktop" "Desktop" /S /COPYALL /LOG:Desktop_Backup_Log.txt /TEE /NP /ETA
START "Backing up Pictures" robocopy "C:\Users\%username%\Pictures" "Pictures" /S /COPYALL /LOG:Pictures_Backup_Log.txt /TEE /NP /ETA
START "Backing up Music" robocopy "C:\Users\%username%\Music" "Music" /S /COPYALL /LOG:Music_Backup_Log.txt /TEE /NP /ETA
START "Backing up Videos" robocopy "C:\Users\%username%\Videos" "Videos" /S /COPYALL /LOG:Videos_Backup_Log.txt /TEE /NP /ETA
START "Backing up Downloads" robocopy "C:\Users\%username%\Downloads" "Downloads" /S /COPYALL /LOG:Downloads_Backup_Log.txt /TEE /NP /ETA
goto exit

:rdoc
START "Restoring Documents" robocopy "Documents" C:\Users\%username%\Documents" /S /COPYALL
START "Backing up Desktop" robocopy "Desktop" "C:\Users\%username%\Desktop" /S /COPYALL
goto home

:rpic
START "Restoring Pictures" robocopy "Pictures" "C:\Users\%username%\Pictures" /S /COPYALL
goto home

:rmus
START "Restoring Music" robocopy "Music" "C:\Users\%username%\Music" /S /COPYALL
goto home

:rvid
START "Restoring Videos" robocopy "Videos" "C:\Users\%username%\Videos" /S /COPYALL
goto home

:rdnl
START "Restoring Downloads" robocopy "Downloads" "C:\Users\%username%\Downloads" /S /COPYALL
goto home

:rall
START "Restoring Documents" robocopy "Documents" C:\Users\%username%\Documents" /S /COPYALL
START "Backing up desktop" robocopy "Desktop" "C:\Users\%username%\Desktop" /S /COPYALL
START "Restoring Pictures" robocopy "Pictures" "C:\Users\%username%\Pictures" /S /COPYALL
START "Restoring Music" robocopy "Music" "C:\Users\%username%\Music" /S /COPYALL
START "Restoring Videos" robocopy "Videos" "C:\Users\%username%\Videos" /S /COPYALL
START "Restoring Downloads" robocopy "Downloads" "C:\Users\%username%\Downloads" /S /COPYALL
goto exit

:exit
exit
