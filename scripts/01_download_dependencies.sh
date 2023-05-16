#!/usr/bin/env bash

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
BUILD_TYPE="$1"
SOURCEDIR="${SCRIPTPATH}/.."

DEPENDENCY_LIST=("armadillo-12.2.0.tar.xz" "blaze-3.8.2.tar.xz" "boost_1_82_0.tar.xz" "eigen-3.4.0.tar.xz" "lapack-3.11.0.tar.xz" "mkl_2023.1.0.tar.xz")

# TODO:
# 1. Ensure output directory exists
# 2. Do not download if file exists
# 3. Verify file by using a hash

for DEP in ${DEPENDENCY_LIST[@]}; do
    set -x
    curl -LO "https://github.com/asif-ansari/urt_deps/raw/main/${DEP}" --output-dir "${SOURCEDIR}/deps"
    set +x
done
