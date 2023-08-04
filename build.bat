SET NDK_PROJECT_PATH=%CD%\sqlite3
ndk-build

mkdir Assets\Plugins\Android\arm64-v8a
copy /y sqlite3\libs\arm64-v8a\libsqlite3.so Assets\Plugins\Android\arm64-v8a

mkdir Assets\Plugins\Android\armeabi-v7a
copy /y sqlite3\libs\armeabi-v7a\libsqlite3.so Assets\Plugins\Android\armeabi-v7a

mkdir Assets\Plugins\Android\x86
copy /y sqlite3\libs\x86\libsqlite3.so Assets\Plugins\Android\x86

mkdir Assets\Plugins\Android\x86_64
copy /y sqlite3\libs\x86_64\libsqlite3.so Assets\Plugins\Android\x86_64