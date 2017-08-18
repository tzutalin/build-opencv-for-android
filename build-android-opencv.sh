#!/bin/bash
NDK_ROOT="${1:-${NDK_ROOT}}"

### ABIs setup
#declare -a ANDROID_ABI_LIST=("x86" "x86_64" "armeabi-v7a with NEON" "arm64-v8a")
declare -a ANDROID_ABI_LIST=("x86" "x86_64" "armeabi" "arm64-v8a" "armeabi-v7a" "mips" "mips64")

### path setup
SCRIPT=$(readlink -f $0)
WD=`dirname $SCRIPT`
OPENCV_ROOT="${WD}/opencv"
N_JOBS=${N_JOBS:-4}

### Download android-cmake
if [ ! -d "${WD}/android-cmake" ]; then
    echo 'Cloning android-cmake'
    git clone https://github.com/taka-no-me/android-cmake.git
fi

INSTALL_DIR="${WD}/android_opencv"
rm -rf "${INSTALL_DIR}/opencv"

### Make each ABI target iteratly and sequentially
for i in "${ANDROID_ABI_LIST[@]}"
do
    ANDROID_ABI="${i}"
    echo "Start building ${ANDROID_ABI} version"

    if [ "${ANDROID_ABI}" = "armeabi" ]; then
        API_LEVEL=19
    else
        API_LEVEL=21
    fi

    temp_build_dir="${OPENCV_ROOT}/platforms/build_android_${ANDROID_ABI}"
    ### Remove the build folder first, and create it
    rm -rf "${temp_build_dir}"
    mkdir -p "${temp_build_dir}"
    cd "${temp_build_dir}"

    cmake -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
          -DCMAKE_TOOLCHAIN_FILE="${WD}/android-cmake/android.toolchain.cmake" \
          -DANDROID_NDK="${NDK_ROOT}" \
          -DANDROID_NATIVE_API_LEVEL=${API_LEVEL} \
          -DANDROID_ABI="${ANDROID_ABI}" \
          -D WITH_CUDA=OFF \
          -D WITH_MATLAB=OFF \
          -D BUILD_ANDROID_EXAMPLES=OFF \
          -D BUILD_DOCS=OFF \
          -D BUILD_PERF_TESTS=OFF \
          -D BUILD_TESTS=OFF \
          -DOPENCV_EXTRA_MODULES_PATH="${WD}/opencv_contrib/modules/"  \
          -DCMAKE_INSTALL_PREFIX="${INSTALL_DIR}/opencv" \
          ../..
    # Build it
    make -j${N_JOBS}
    # Install it
    make install/strip
    ### Remove temp build folder
    cd "${WD}"
    rm -rf "${temp_build_dir}"
    echo "end building ${ANDROID_ABI} version"
done
