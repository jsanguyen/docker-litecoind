#!/bin/sh
#Entry Point for docker start up, logs out the .conf used after running the litecoin set up script. 
set -e

litecoind_setup.sh

echo "################################################"
echo "# Configuration used: /litecoin/litecoin.conf  #"
echo "################################################"
echo ""
cat /litecoin/litecoin.conf
echo ""
echo "################################################"

exec litecoind -datadir=/litecoin -conf=/litecoin/litecoin.conf -printtoconsole "$@"
