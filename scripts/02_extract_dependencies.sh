#!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo "------------------------------------------------------"
echo "               EXTRACT DEPENDENCIES                   "
echo "------------------------------------------------------"

SOURCEDIR="${SCRIPTPATH}/.."
DEPS_PATH="${SOURCEDIR}/deps"
EXT_PATH="${SOURCEDIR}/ext"

if ! [ -d "${EXT_PATH}" ]; then
    mkdir "${EXT_PATH}"
fi

for file in "${DEPS_PATH}"/*.tar.xz; do
    echo "Extracting ${file##*/}"
    tar -xf "$file" -C "${EXT_PATH}" 2> /dev/null
done
