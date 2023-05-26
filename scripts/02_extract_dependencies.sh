#!/usr/bin/env bash
# TODO: Now it is not used. This is borrowed from URT project. We can use it for extracting the files.
# No extra variables to be declared here. All variables should be exported from run_all.sh script

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
