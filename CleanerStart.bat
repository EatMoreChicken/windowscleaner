@echo off
color a
title Filedeletanator
REM ==========================================================================
REM ---------- Intro ----------
echo --------------------------------------------------------------------------
echo ----------------------- Welcome to Filedeletanator! ----------------------
echo -----------------------  by Efrin and Emlin Charly  ----------------------
echo --------------------------------------------------------------------------
REM   _____ _ _          _      _      _                    _             
REM  |  ___(_) | ___  __| | ___| | ___| |_ __ _ _ __   __ _| |_ ___  _ __ 
REM  | |_  | | |/ _ \/ _` |/ _ \ |/ _ \ __/ _` | '_ \ / _` | __/ _ \| '__|
REM  |  _| | | |  __/ (_| |  __/ |  __/ || (_| | | | | (_| | || (_) | |   
REM  |_|   |_|_|\___|\__,_|\___|_|\___|\__\__,_|_| |_|\__,_|\__\___/|_|   
                                                       
REM ---------- File's expiry date ;) ----------
SET days=20
REM ---------- Root of the directory to delete from ----------
REM Keep "" around the source location
SET source="C:\Camera Footage"
REM ---------- Setting current date and time ----------
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a%%b)
SET logname=%mydate%_%mytime%
REM ---------- Destination for log.txt ----------
SET log="C:\Logs\%logname%.txt"



REM ==========================================================================
REM ---------- Starting ----------
REM echo Deleting files older than %days% days
echo [-] Deleting files older than %days% from %source%
echo [-] Deleting empty sub-directories from %source%
echo ------------------------------

REM ---------- Deletes all files older than n days ----------
ForFiles /p %source% /s /d -%days% /c "cmd /c del @path /Q" 
cls
echo --------------------------------------------------------------------------
echo ----------------------- Welcome to Filedeletanator! ----------------------
echo -----------------------  by Efrin and Emlin Charly  ----------------------
echo --------------------------------------------------------------------------
echo [+] Deleting files older than %days% from %source%
echo [-] Deleting empty sub-directories from %source%
echo ------------------------------

REM ---------- Removing empty folders and writing to log ----------
ROBOCOPY %source% %source% /S /MOVE >> %log%
cls
echo --------------------------------------------------------------------------
echo ----------------------- Welcome to Filedeletanator! ----------------------
echo -----------------------  by Efrin and Emlin Charly  ----------------------
echo --------------------------------------------------------------------------
echo [+] Deleting files older than %days% from %source%
echo [+] Deleting empty sub-directories from %source%
echo ------------------------------



REM ==========================================================================
REM ---------- Completion notification ----------
echo Older files and empty directories cleanup complete!
pause >nul