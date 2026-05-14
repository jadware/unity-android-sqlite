# Unity SQLite Native Libraries

Prebuilt SQLite native plugin binaries for Unity, with scripts to rebuild for Android and Windows targets.

## Included SQLite version

- **SQLite 3.51.3** (amalgamation source in `sqlite3/jni/src/`)

## What this repository contains

- Android `.so` libraries for:
  - `arm64-v8a`
  - `armeabi-v7a`
  - `x86`
  - `x86_64`
- Windows `.dll` libraries for Unity Editor/Standalone:
  - `x86`
  - `x64`
- WSA (Windows Store / UWP) `.dll` libraries:
  - `ARM`
  - `x86`
  - `x64`

Plugin output folders are under `Assets/Plugins/`.

## Build Android libraries

### Requirements

- Android NDK with `ndk-build` available in `PATH`
- Windows command prompt (script is a `.bat` file)

### Command

```bat
build.bat
```

This compiles `sqlite3` via `ndk-build` and copies generated `libsqlite3.so` files into:

- `Assets/Plugins/Android/arm64-v8a/`
- `Assets/Plugins/Android/armeabi-v7a/`
- `Assets/Plugins/Android/x86/`
- `Assets/Plugins/Android/x86_64/`

## Build Windows libraries

### Requirements

- Visual Studio Build Tools (script currently references:
  `C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvarsall.bat`)

### Command

```bat
build-windows.bat
```

This compiles `sqlite3.dll` for:

- `Assets/Plugins/x86/sqlite3.dll`
- `Assets/Plugins/x64/sqlite3.dll`
- `Assets/Plugins/WSA/ARM/sqlite3.dll`

## Source references

- SQLite source files live in `sqlite3/jni/src/`.
- Android NDK module file: `sqlite3/jni/Android.mk`.

## Notes

- This repository is focused on native plugin binaries for Unity.
- Managed SQLite usage in Unity C# can vary by project setup (`Mono.Data.Sqlite`, P/Invoke wrappers, etc.).

## External references

- https://stackoverflow.com/questions/60592556/nexus7-cant-load-native-library
- https://developer.android.com/games/optimize/64-bit
- https://github.com/YokotaRina/StudyRoom/blob/72cff207d67010891ca4b143af61afe00cca7630/BollPool/Assets/Script/SQLite/SQLite.cs
- https://github.com/yousetsu/DualNBack-Habits/blob/128718f0832ef1076ece3d23bd538cd224882fee/Assets/Script/SqliteDatabase.cs
- https://github.com/KannoYuto/HAC2023/blob/2e7ce86754e73aafd5c15108872d147314457b94/Scripts/Kanno/SqliteDatabase.cs
- https://github.com/K1212TK/TaskSchedule/blob/f6d0d7ca5f958726f7d78c03f209d6cd2afae368/Assets/Script/SQLite/SqliteDatabase.cs
- https://github.com/sh1ch/unity-sqliteAAR-practice/tree/master
- https://github.com/search?q=libsqlitex+unityengine&type=Code
