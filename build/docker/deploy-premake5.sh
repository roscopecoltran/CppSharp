#!/bin/sh
set -x
set -e

clear
echo 

mv ${DOCKER_USER_HOME}/build/premake5 ${DOCKER_USER_HOME}/build/premake5.old.$(date +%F-%T)
cp -f /tmp/premake5/bin/release/premake5 ${DOCKER_USER_HOME}/build/
chmod +x ${DOCKER_USER_HOME}/build/premake5


