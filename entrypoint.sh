#!/bin/bash

set -x

DEVPI_SERVERDIR="/data/server"
DEVPI_CLIENTDIR="/data/client"


echo "[RUN]: Starting devpi-server"
/usr/bin/supervisord -c /config/supervisord.conf

# exec /usr/bin/devpi-server --host 0.0.0.0 --port 3141 --restrict-modify root --threads 20

if [ ! -f  $DEVPI_SERVERDIR/.serverversion ]; then
    echo "[RUN]: Initialise devpi-server"
    sleep 10
    devpi-init
    devpi use http://localhost:3141
    devpi login root --password=''
    devpi user -m root password="password"
    devpi index -y -c public pypi_whitelist='*'
fi

echo "[INFO]: Sleeping til we quit"
while true; do sleep 1000; done
