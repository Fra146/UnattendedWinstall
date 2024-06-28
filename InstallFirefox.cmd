@echo off
setlocal

:: Set the URL for the Firefox installer
set "URL=https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"

:: Set the name for the downloaded installer
set "FILENAME=FirefoxInstaller.exe"

:: Download the installer using PowerShell
echo Downloading Firefox installer...
powershell -Command "Invoke-WebRequest -Uri %URL% -OutFile %FILENAME%"

:: Check if the download was successful
if not exist %FILENAME% (
    echo Failed to download Firefox installer.
    exit /b 1
)

:: Run the installer silently
echo Installing Firefox...
%FILENAME% -ms

:: Check if Firefox was installed successfully
if exist "C:\Program Files\Mozilla Firefox\firefox.exe" (
    echo Firefox has been installed successfully.
    del %FILENAME%
    exit /b 0
) else (
    echo Firefox installation failed.
    exit /b 1
)

endlocal
