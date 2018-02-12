#!/bin/sh

# Requirements:
# ANDROID_HOME pointing to installed Android SDK
# ANDROID_NDK pointing to installed Android NDK
# ANDROID_CMAKE pointing to $ANDROID_HOME/cmake/VERSION_TO_USE

export CMAKE_BIN=$ANDROID_CMAKE/bin
export ANDROID_NDK=~/developer/android-ndk-r14b/
export CMAKE_TOOLCHAIN_FILE=$ANDROID_NDK/build/cmake/android.toolchain.cmake
export TOOLCHAIN=$ANDROID_NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/
export PATH=$TOOLCHAIN/bint:$PATH
export AR=arm-linux-androideabi-ar
export CC=arm-linux-androideabi-clang
export CXX=arm-linux-androideabi-clang++
export LINK=arm-linux-androideabi-clang++
export STRIP=arm-linux-androideabi-strip
# override CXX and CC
_CXX="${TOOLCHAIN}/bin/${CXX}"
_CC="${TOOLCHAIN}/bin/${CC}"

#$CMAKE_BIN/cmake -DWITH_JNI=ON -G "Android Gradle - Unix Makefiles" -DANDROID_ABI=armeabi-v7a -DANDROID_NDK=$ANDROID_NDK -DCMAKE_BUILD_TYPE=Release -DANDROID_NATIVE_API_LEVEL=16 -DANDROID_TOOLCHAIN=clang
cmake $CMAKE_GEN $CC_PREFIX $ICU_PATH $LTO $LTTNG $STATIC_LIBRARY $ARCH $TARGET_OS \
    $ENABLE_CC_XPLAT_TRACE $EXTRA_DEFINES -DCMAKE_BUILD_TYPE=$BUILD_TYPE $SANITIZE $NO_JIT $INTL_ICU \
    $WITHOUT_FEATURES $WB_FLAG $WB_ARGS $CMAKE_EXPORT_COMPILE_COMMANDS $LIBS_ONLY_BUILD\
    $VALGRIND $BUILD_RELATIVE_DIRECTORY

#$CMAKE_BIN/ninja
