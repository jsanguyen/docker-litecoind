#!/bin/bash

docker volume create --name=litecoind-data
docker run -d --name litecoind-node -v litecoind-data:/litecoin -p 9333:9333 --restart unless-stopped jsonguyen1/docker-litecoind
docker logs -f litecoind-node