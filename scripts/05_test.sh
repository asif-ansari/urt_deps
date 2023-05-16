#!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
BUILD_TYPE="$1"

echo "------------------------------------------------------"
echo "                    TESTS                             "
echo "------------------------------------------------------"
OS=$(uname)
echo "OS     = ${OS}"
echo "------------------------------------------------------"

# TODO: Accept list of Tests and execute one by one
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    echo "TODO: Test in windows and then remove the if clause"
else
    "${TEST_FILES_PATH}/${TEST_EXECUTABLES}"
fi

