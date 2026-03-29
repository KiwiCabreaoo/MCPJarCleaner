@echo off
setlocal enabledelayedexpansion
title JAR Cleaner
color 0b

set "sep================================================================"

echo %sep%
echo           META-INF REMOVER (RELEASE VERSION)
echo %sep%
echo.

set "rawPath=%~1"
if "%rawPath%"=="" (
    echo [PROMPT] Drag and drop your JAR here or type the name:
    set /p "rawPath="
)
set "jarPath=%rawPath:"=%"

if not exist "!jarPath!" (
    color 0c
    echo [ERROR] Target file not found.
    pause
    exit
)

set "TOOL_PATH="
if exist "C:\Program Files\7-Zip\7z.exe" (set "TOOL_PATH=C:\Program Files\7-Zip\7z.exe" & set "CMD_TYPE=7Z")
if "%TOOL_PATH%"=="" if exist "C:\Program Files (x86)\7-Zip\7z.exe" (set "TOOL_PATH=C:\Program Files (x86)\7-Zip\7z.exe" & set "CMD_TYPE=7Z")
if "%TOOL_PATH%"=="" if exist "C:\Program Files\WinRAR\WinRAR.exe" (set "TOOL_PATH=C:\Program Files\WinRAR\WinRAR.exe" & set "CMD_TYPE=RAR")
if "%TOOL_PATH%"=="" if exist "C:\Program Files (x86)\WinRAR\WinRAR.exe" (set "TOOL_PATH=C:\Program Files (x86)\WinRAR\WinRAR.exe" & set "CMD_TYPE=RAR")

if "%TOOL_PATH%"=="" (
    color 0c
    echo [ERROR] Neither 7-Zip nor WinRAR was found on this system.
    pause
    exit
)

echo [1/3] Creating backup: !jarPath:.jar=_unmodified.jar!
copy /y "!jarPath!" "!jarPath:.jar=_unmodified.jar!" >nul

echo [2/3] Checking JAR contents...
"!TOOL_PATH!" l "!jarPath!" META-INF >nul 2>&1
if %errorlevel% neq 0 (
    echo [SKIP] META-INF not found. This JAR is already clean!
    goto :finish
)

echo [3/3] Removing signatures...
if "%CMD_TYPE%"=="7Z" (
    "!TOOL_PATH!" d "!jarPath!" META-INF -r >nul 2>&1
) else (
    "!TOOL_PATH!" d "!jarPath!" META-INF >nul 2>&1
)

if %errorlevel% equ 0 (
    :finish
    echo.
    echo %sep%
    echo              PROCESS COMPLETED SUCCESSFULLY
    echo %sep%
    echo [INFO] Original: !jarPath:.jar=_unmodified.jar!
    echo [INFO] Ready to use: !jarPath!
    echo.
) else (
    color 0c
    echo.
    echo [ERROR] The file is locked. Please CLOSE your IDE/Game first.
    echo.
)

pause