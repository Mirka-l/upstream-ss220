@echo off
cd /d "%~dp0..\.." >nul 2>&1
call tools\bootstrap\python.bat tools\translations\split_ru_names.py --clean >nul 2>&1
exit /b %ERRORLEVEL%
