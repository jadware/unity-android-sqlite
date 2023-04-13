#!/bin/bash

# Set the NDK path
export NDK=~/SDK/ndk/23.2.8568313

# Set the toolchain path
export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64

# Set the build targets
export TARGETS=(aarch64-linux-android28 armv7a-linux-androideabi28 i686-linux-android28 x86_64-linux-android28)

# Set the sysroot path
export SYSROOT=$NDK/sysroot

# Set the CFLAGS and LDFLAGS
export CFLAGS="-I$SYSROOT/usr/include -fPIC -DANDROID -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DSQLITE_ENABLE_JSON1 -DSQLITE_OMIT_DEPRECATED -DSQLITE_OMIT_DECLTYPE -DSQLITE_MAX_EXPR_DEPTH -DSQLITE_LIKE_DOESNT_MATCH_BLOBS -DSQLITE_ENABLE_RTREE -DSQLITE_OMIT_TRIGGERS -Os -ffunction-sections -fdata-sections"
export LDFLAGS="-L$SYSROOT/usr/lib/$TARGET -llog -Wl,--gc-sections,--strip-all"

# Set the output directories
export OUT_DIRS=(arm64-v8a armeabi-v7a x86 x86_64)

# Create the output directories if they do not exist
for dir in "${OUT_DIRS[@]}"; do
    mkdir -p $dir
done

# Build the libraries
for i in "${!TARGETS[@]}"; do
    $TOOLCHAIN/bin/${TARGETS[$i]}-clang -shared -o ${OUT_DIRS[$i]}/libsqlite3.so sqlite3.c $CFLAGS $LDFLAGS
done