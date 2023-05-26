#!/usr/bin/env bash

echo "------------------------------------------------------"
echo "                BUILD - ${LIB_NAME} - ${BUILD_TYPE}   "
echo "                OS    = ${OSTYPE}                      "
echo "------------------------------------------------------"

set -euo pipefail
#TODO: Use nthreads for build
nthreads=$(((${nproc}/2) + 1))
echo "Number of threads requested: $nthreads"

# Set the CMAKE_BUILD_PARALLEL_LEVEL variable
export CMAKE_BUILD_PARALLEL_LEVEL=$nthreads
set -x
# Run the build
if ! cmake --build "${BUILD_DIR}" --config "${BUILD_TYPE}" --target install; then
    echo "Error: Failed to build and install ${LIB_NAME} project" >&2
    exit 1
fi
set +x
