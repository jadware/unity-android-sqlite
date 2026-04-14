@echo off
setlocal

call :CopyAndHash arm64-v8a || exit /b 1
call :CopyAndHash armeabi-v7a || exit /b 1
call :CopyAndHash x86 || exit /b 1
call :CopyAndHash x86_64 || exit /b 1

echo.
echo Done.
exit /b 0

:CopyAndHash
set "ABI=%~1"
set "SRC=sqlite3\libs\%ABI%\libsqlite3.so"
set "DST_DIR=Assets\Plugins\Android\%ABI%"
set "DST=%DST_DIR%\libsqlite3.so"

echo.
echo ===== %ABI% =====
if not exist "%SRC%" (
  echo [ERROR] Missing source file: %SRC%
  exit /b 1
)

if not exist "%DST_DIR%" mkdir "%DST_DIR%"
copy /y "%SRC%" "%DST_DIR%" >nul
if errorlevel 1 (
  echo [ERROR] Copy failed for %ABI%
  exit /b 1
)

echo Source hash:
certutil -hashfile "%SRC%" SHA256 | findstr /r /v /c:"hash of file" /c:"CertUtil:"
echo Target hash:
certutil -hashfile "%DST%" SHA256 | findstr /r /v /c:"hash of file" /c:"CertUtil:"

exit /b 0
