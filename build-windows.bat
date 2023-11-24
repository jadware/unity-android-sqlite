"%SystemDrive%\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x86
cl sqlite3/jni/src/sqlite3.c -O2 -DSQLITE_ENABLE_COLUMN_METADATA -link -dll -out:Assets\Plugins\x86\sqlite3.dll

"%SystemDrive%\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" x64
cl sqlite3/jni/src/sqlite3.c -O2 -DSQLITE_ENABLE_COLUMN_METADATA -link -dll -out:Assets\Plugins\x64\sqlite3.dll

"%SystemDrive%\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvarsall.bat" arm64
cl sqlite3/jni/src/sqlite3.c -link -dll -Os -DSQLITE_ENABLE_COLUMN_METADATA -out:Assets\Plugins\WSA\ARM\sqlite3.dll