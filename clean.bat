@echo off
setlocal

set "PLUGINS_DIR=Assets\Plugins"

if not exist "%PLUGINS_DIR%" (
    echo Plugins directory not found: %PLUGINS_DIR%
    exit /b 0
)

for /r "%PLUGINS_DIR%" %%f in (*.so) do (
    del /f /q "%%f"
    echo Deleted %%f
)

endlocal
