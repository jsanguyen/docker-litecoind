#!/bin/bash

sudo docker volume create --name=litecoind-data
sudo docker run -d --name litecoind-node -v litecoind-data:/litecoin -p 9333:9333 --restart unless-stopped jsonguyen1/docker-litecoind
sudo docker logs -f litecoind-node