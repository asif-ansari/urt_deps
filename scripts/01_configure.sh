#!/usr/bin/env bash

echo "------------------------------------------------------"
echo "      CONFIGURE - ${LIB_NAME} - ${BUILD_TYPE}         "
echo "------------------------------------------------------"
echo "            OS     = ${OSTYPE}                        "
echo "------------------------------------------------------"

set -euo pipefail

# Create the build directory
if ! mkdir -pv "${BUILD_DIR}"; then
    echo "Error: Failed to create build directory ${BUILD_DIR}" >&2
    exit 1
fi

# # Create the INSTALL directory
# if ! mkdir -pv "${INSTALL_DIR}"; then
#     echo "Error: Failed to create build directory ${INSTALL_DIR}" >&2
#     exit 1
# fi

# clean everything from build directory
echo "Cleaning directory: ${BUILD_DIR} & ${INSTALL_DIR}"
set -x
rm -rf "${BUILD_DIR}"/*
rm -rf "${INSTALL_DIR}"/*

# TODO: handle BUILD_TYPE for VS-Windows(Warning).
# Configure and build the CMake project
if ! cmake -G "${GENERATOR}" -S "${SOURCEDIR}" -B "${BUILD_DIR}" -D CMAKE_BUILD_TYPE="${BUILD_TYPE}" -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}; then
    echo "Error: Failed to configure ${LIB_NAME} project" >&2
    exit 1
fi
{ set +x; } 2>/dev/null
