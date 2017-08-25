#!/bin/sh
set -x
set -e

clear
echo 

export PAKET_VCS_URI=${PAKET_VCS_URI:-"fsprojects/Paket"}
export PAKET_VERSION=${PAKET_VERSION:-5.89.2}

curl -sL https://raw.githubusercontent.com/${PAKET_VCS_URI}/${PAKET_VERSION}/install.sh | /bin/sh
paket --version 

echo 
