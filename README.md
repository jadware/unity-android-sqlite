# Android SQLite (`libsqlite3.so`) Builds for Unity

Prebuilt and reproducible Android native SQLite binaries for Unity projects, including `x86_64` support for Magic Leap 2.

## Purpose
This repository provides a straightforward way to build and validate `libsqlite3.so` for Android ABIs commonly used by Unity.

Use this repo when you need to:
- Include SQLite as a native Android plugin in a Unity project.
- Ensure 64-bit support (including `x86_64`) for devices such as Magic Leap 2.
- Produce consistent `libsqlite3.so` outputs from the SQLite amalgamation source.

## SQLite Version
Current target version: **3.51.3**.

## What this repository builds
The build process compiles SQLite from the SQL amalgamation ZIP into ABI-specific shared libraries:
- `arm64-v8a/libsqlite3.so`
- `armeabi-v7a/libsqlite3.so`
- `x86/libsqlite3.so`
- `x86_64/libsqlite3.so`

(Exact output folders depend on the build script implementation.)

## Prerequisites
Before running the build, ensure you have:
- A Linux environment with standard build tooling.
- Android NDK/toolchain available for cross-compiling Android shared libraries.
- Permission to run shell scripts with elevated privileges if needed by your environment.

## Build Instructions
From the repository root, run:

```bash
sudo bash build.sh
```

## Verify Build Outputs
After a successful build, verify the generated binaries:

```bash
file */libsqlite3.so
```

This should report Android ELF shared objects for each ABI output folder.

## Unity Integration Notes
- Copy each ABI's `libsqlite3.so` into the corresponding Unity Android plugin ABI folder.
- In Unity, ensure plugin import settings map each library to the correct Android architecture.
- Keep ABI coverage aligned with your Player Settings target architectures.

## References
https://stackoverflow.com/questions/60592556/nexus7-cant-load-native-library
https://developer.android.com/games/optimize/64-bit
https://github.com/YokotaRina/StudyRoom/blob/72cff207d67010891ca4b143af61afe00cca7630/BollPool/Assets/Script/SQLite/SQLite.cs
https://github.com/yousetsu/DualNBack-Habits/blob/128718f0832ef1076ece3d23bd538cd224882fee/Assets/Script/SqliteDatabase.cs
https://github.com/KannoYuto/HAC2023/blob/2e7ce86754e73aafd5c15108872d147314457b94/Scripts/Kanno/SqliteDatabase.cs
https://github.com/K1212TK/TaskSchedule/blob/f6d0d7ca5f958726f7d78c03f209d6cd2afae368/Assets/Script/SQLite/SqliteDatabase.cs
https://github.com/sh1ch/unity-sqliteAAR-practice/tree/master
https://github.com/search?q=libsqlitex+unityengine&type=Code
