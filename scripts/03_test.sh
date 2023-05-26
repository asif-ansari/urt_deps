#!/usr/bin/env bash
# TODO: This is just a placeholder for running tests.

echo "------------------------------------------------------"
echo "               TESTS  - ${LIB_NAME} - ${BUILD_TYPE}   "
echo "------------------------------------------------------"
echo "               OS     = ${OSTYPE}                     "
echo "------------------------------------------------------"

# TODO: Accept list of Tests and execute one by one
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    echo "TODO: Test in windows and then remove the if clause"
else
    "${TEST_FILES_PATH}/${TEST_EXECUTABLES}"
fi

