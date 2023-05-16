#!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "------------------------------------------------------"
echo "              CONFIGURE - ${BUILD_TYPE}               "
echo "------------------------------------------------------"
OS=$(uname)
echo "OS     = ${OS}"
echo "------------------------------------------------------"

# SOURCEDIR="${SCRIPTPATH}/.."
# if [ "${BUILD_TYPE}" = "Release" ]; then
#     BUILD_DIR="${SOURCEDIR}/build/release"
# elif [ "${BUILD_TYPE}" = "Debug" ]; then
#     BUILD_DIR="${SOURCEDIR}/build/debug"
# else
#     echo "Mention build type."
#     exit 1
# fi

# if ! [ -d "${BUILD_DIR}" ]; then
mkdir -p "${BUILD_DIR}"
# fi

# clean only artifacts (object files and libraries)
# cmake clean "${BUILD_DIR}/"

# clean everything from build directory
echo "Cleaning directory: ${BUILD_DIR}"
set -x
rm -rf "${BUILD_DIR}"/*
{ set +x; } 2>/dev/null

# TODO: Detect OS using $OS_TYPE as done in build.sh. Better to detect once in runall script
if [ "${OS}" =  "Linux" ]; then
    set -x
    cmake -G "Unix Makefiles" -S ${SOURCEDIR} -B ${BUILD_DIR} -D CMAKE_BUILD_TYPE="${BUILD_TYPE}"
    { set +x; } 2>/dev/null
elif [ "${OS}" =  "Darwin" ]; then
    set -x
    cmake -G "Unix Makefiles" -S ${SOURCEDIR} -B ${BUILD_DIR} -D CMAKE_BUILD_TYPE="${BUILD_TYPE}"
    { set +x; } 2>/dev/null
elif [ "${OS:0:7}" = "MINGW64" ]; then
    set -x
    cmake -G "Visual Studio 17 2022" -S ${SOURCEDIR} -B ${BUILD_DIR}
    { set +x; } 2>/dev/null
else
    echo "ERROR: Unknow OS -> ${OS}"
    exit 1
fi
