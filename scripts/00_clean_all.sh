#!/usr/bin/env bash

# Script: 00_clean_all.sh
echo "------------------------------------------------------"
echo "                  CLEAN ALL    :    ${LIB_NAME}       "
echo "------------------------------------------------------"

set -euo pipefail

rm -rf "${BUILD_DIR}"
# Remove the build directory if it exists
if [ -d "${BUILD_DIR}" ]; then
    if ! rm -rvf "${BUILD_DIR}"; then
        echo "Error: Failed to remove build directory ${BUILD_DIR}" >&2
        exit 1
    fi
fi
