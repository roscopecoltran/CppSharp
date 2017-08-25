#!/bin/sh
set -x
set -e

clear
echo 

export NUGET_DIST_URI=${NUGET_DIST_URI:-"dist.nuget.org/win-x86-commandline"}
export NUGET_VERSION=${NUGET_VERSION:-4.1.0}

wget -P /usr/lib/mono https://${NUGET_DIST_URI}/v${NUGET_VERSION}/nuget.exe
echo -e '#!/bin/sh\nexec /usr/bin/mono $MONO_OPTIONS /usr/lib/mono/nuget.exe "$@"' > /usr/bin/nuget
chmod +x /usr/bin/nuget
nuget

echo
