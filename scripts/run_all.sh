#!/usr/bin/env bash
# Usages: []
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Not considering year, as it increases the length of filename.
CURRENT_DATE_TIME=`date +"%m-%d_%H-%M-%S"`
RELEASE_LOGFILE_NAME=Release_log_"${CURRENT_DATE_TIME}".log
DEBUG_LOGFILE_NAME=Debug_log_"${CURRENT_DATE_TIME}".log


# Fill all library names here, after testing one by one
all_libraries=("armadillo-12.2.0")

# TODO: stop if previous script fails

# Clean Release
export BUILD_TYPE="Release"
export LIB_NAME="armadillo-12.2.0" #TODO: Should get from all_libraries  
export BUILD_DIR="${SCRIPTPATH}/../build/${LIB_NAME}/release"
export SOURCEDIR="${SCRIPTPATH}/../source/${LIB_NAME}"

bash "${SCRIPTPATH}"/00_clean_all.sh 2>&1 | tee "${RELEASE_LOGFILE_NAME}"
bash "${SCRIPTPATH}"/03_configure.sh 2>&1 | tee -a "${RELEASE_LOGFILE_NAME}"
bash "${SCRIPTPATH}"/04_build.sh 2>&1 | tee -a "${RELEASE_LOGFILE_NAME}"

export TEST_FILES_PATH=${BUILD_DIR}/tests1/
# TODO: Use it as a list to keep all the test executables
export TEST_EXECUTABLES=smoke_test
bash "${SCRIPTPATH}"/05_test.sh 2>&1 | tee -a "${RELEASE_LOGFILE_NAME}"

# Clean Debug
# export BUILD_TYPE="Debug"
# bash "${SCRIPTPATH}"/00_clean_all.sh Debug 2>&1 | tee "${DEBUG_LOGFILE_NAME}"
# bash "${SCRIPTPATH}"/01_download_dependencies.sh Debug 2>&1 | tee -a "${RELEASE_LOGFILE_NAME}"
# bash "${SCRIPTPATH}"/02_extract_dependencies.sh Debug 2>&1 | tee -a "${DEBUG_LOGFILE_NAME}"
# bash "${SCRIPTPATH}"/03_configure.sh Debug 2>&1 | tee -a "${DEBUG_LOGFILE_NAME}"
# bash "${SCRIPTPATH}"/04_build.sh Debug 2>&1 | tee -a "${DEBUG_LOGFILE_NAME}"
# bash "${SCRIPTPATH}"/05_test.sh Release 2>&1 | tee -a "${DEBUG_LOGFILE_NAME}"
