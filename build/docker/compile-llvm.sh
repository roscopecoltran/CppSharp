#!/bin/sh
set -x
set -e

clear
echo

## #################################################################
## Building LLVM and Clang from source
## refs. 
##  - https://github.com/mono/CppSharp/blob/sniperkit/docs/GettingStarted.md#building-llvm-and-clang-from-source
##  - https://github.com/mono/CppSharp/blob/master/docs/BuildingLLVM.md#compiling-on-linux
##  -  
## #################################################################

cd ${DOCKER_USER_HOME}/build
pwd

rm -Rf ./scripts/llvm-cad143-linux-x64-Release*

echo
cat LLVM-commit
echo

echo
cat Clang-commit
echo

./premake5 --file=scripts/LLVM.lua download_llvm # on Linux

# tar -xz -C ./scripts/llvm-cad143-linux-x64-Release -f ./scripts/llvm-cad143-linux-x64-Release.tar.xz && \

mkdir -p ${DOCKER_USER_HOME}/deps/llvm/build 
cd ${DOCKER_USER_HOME}/deps/llvm/build 

cmake -G Ninja 	-DCLANG_BUILD_EXAMPLES=false \
                -DCLANG_INCLUDE_DOCS=false \
                -DCLANG_INCLUDE_TESTS=false \
	            -DCLANG_INCLUDE_DOCS=false \
	            -DCLANG_BUILD_EXAMPLES=false \
	            -DLLVM_TARGETS_TO_BUILD="X86" \
	            -DLLVM_INCLUDE_EXAMPLES=false \
	            -DLLVM_INCLUDE_DOCS=false \
	            -DLLVM_INCLUDE_TESTS=false \
	            ..

ninja

echo 

