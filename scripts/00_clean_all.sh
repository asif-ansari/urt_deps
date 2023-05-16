#!/usr/bin/env bash

# Script: 00_clean_all.sh
# Description: This script performs a cleanup task.
# Usage: 00_clean_all.sh [build-options] [lib-folder-name]
# build-options:
#   Debug,      Debug Build.
#   Release     Release Build.
#
# lib-folder-name: Name of the library(Check in source folder & get the name of the library with version.)

# Examples:
#   00_clean_all.sh Debug armadillo-12.2.0

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SOURCEDIR="${SCRIPTPATH}/.."

echo "------------------------------------------------------"
echo "                  CLEAN ALL    :    ${LIB_NAME}       "
echo "------------------------------------------------------"

# TODO:
# 1. Add safety check, verify that variables are not empty.
# 2. Use verbose version of rm
# 3. Check for failures of the command

if [ "${BUILD_TYPE}" = "Release" ]; then
    rm -rf "${SOURCEDIR}/build/${LIB_NAME}/release"
elif [ "${BUILD_TYPE}" = "Debug" ]; then
    rm -rf "${SOURCEDIR}/build/${LIB_NAME}/debug"
else
    echo "Mention build type."
    exit 1
fi
