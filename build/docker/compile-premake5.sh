#!/bin/sh
set -x
set -e

clear
echo 

# Set temp environment vars
export PREMAKE5_REPO=https://github.com/premake/premake-core.git
export PREMAKE5_BRANCH=${PREMAKE5_BRANCH:-"v5.0.0-alpha12"}
export PREMAKE5_PATH=/tmp/premake5

git clone -b ${PREMAKE5_BRANCH} --depth 1 -- ${PREMAKE5_REPO} ${PREMAKE5_PATH}
cd ${PREMAKE5_PATH}
make -f Bootstrap.mak linux 

echo 

