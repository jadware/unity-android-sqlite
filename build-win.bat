@echo off
setlocal enabledelayedexpansion

set "SRC=sqlite3\jni\src\sqlite3.c"
set "COMMON_FLAGS=/O2 /DSQLITE_ENABLE_COLUMN_METADATA"

if not exist "%SRC%" (
    echo [ERROR] Source file not found: %SRC%
    exit /b 1
)

call :FindVsDevCmd
if errorlevel 1 exit /b 1

call :BuildOne x86 Assets\Plugins\x86\sqlite3.dll
if errorlevel 1 exit /b 1

call :BuildOne x64 Assets\Plugins\x64\sqlite3.dll
if errorlevel 1 exit /b 1

echo.
echo [OK] Windows sqlite3.dll builds completed.
exit /b 0

:BuildOne
set "ARCH=%~1"
set "OUT=%~2"

echo.
echo ===== Building %ARCH% =====

for %%I in ("%OUT%") do set "OUT_DIR=%%~dpI"
if not exist "!OUT_DIR!" mkdir "!OUT_DIR!"

call "%VSDEVCMD%" -arch=%ARCH% >nul
if errorlevel 1 (
    echo [ERROR] Failed to initialize Visual Studio toolchain for %ARCH%
    exit /b 1
)

cl "%SRC%" %COMMON_FLAGS% /link /DLL /OUT:"%OUT%"
if errorlevel 1 (
    echo [ERROR] Build failed for %ARCH%
    exit /b 1
)

echo [OK] %OUT%
exit /b 0

:FindVsDevCmd
set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if exist "%VSWHERE%" (
    for /f "usebackq delims=" %%I in (`"%VSWHERE%" -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -find Common7\Tools\VsDevCmd.bat`) do (
        set "VSDEVCMD=%%I"
    )
)

if defined VSDEVCMD if exist "%VSDEVCMD%" (
    echo Using Visual Studio Developer Command Prompt:
    echo %VSDEVCMD%
    exit /b 0
)

echo [ERROR] Could not find VsDevCmd.bat.
echo Install Visual Studio with C++ build tools, or set VSDEVCMD manually.
exit /b 1
