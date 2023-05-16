#!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# BUILD_TYPE="$1"

echo "------------------------------------------------------"
echo "                BUILD - ${BUILD_TYPE}                 "
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

# Detect the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    nproc=$(nproc)
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    # Windows
    nproc=$(wmic cpu get NumberOfCores | grep -v NumberOfCores | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    nproc=$(sysctl -n hw.ncpu)
else
    echo "Unsupported operating system: $OSTYPE"
    exit 1
fi

nthreads=$(((nproc/2) + 1))

echo "Number of threads requested: $nthreads"

# Set the CMAKE_BUILD_PARALLEL_LEVEL variable
export CMAKE_BUILD_PARALLEL_LEVEL=$nthreads

# Run the build
cmake --build "${BUILD_DIR}" --config "${BUILD_TYPE}"
