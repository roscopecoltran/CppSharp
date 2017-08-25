#!/bin/sh
set -x
set -e

clear
echo

CUR_DIR=$(cd "$(dirname "$0")"; pwd)

if [ "$(uname)" == "Darwin" ]; then
	PREMAKE=$CUR_DIR/premake5-osx;
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	PREMAKE=$CUR_DIR/premake5-linux-64;
fi

MONO_VERSION_OUTPUT="$(mono --version)"
if [[ $MONO_VERSION_OUTPUT == *"amd64"* ]]; then
	BUILD_CONF=release_x64;
else
	BUILD_CONF=release_x86;
fi

$PREMAKE --file=${DOCKER_USER_HOME}/build/premake5.lua gmake
config=$BUILD_CONF make -C ${DOCKER_USER_HOME}/build/gmake/

BUILD_CONF_DIR="$(tr '[:lower:]' '[:upper:]' <<< ${BUILD_CONF:0:1})${BUILD_CONF:1}"
BUILD_DIR=${DOCKER_USER_HOME}/build/gmake/lib/$BUILD_CONF_DIR

# Workaround for testing issue
mkdir -p $CUR_DIR/gmake/lib/lib/$BUILD_CONF_DIR
cp $BUILD_DIR/libNamespacesBase.* $CUR_DIR/gmake/lib/lib/$BUILD_CONF_DIR

echo
