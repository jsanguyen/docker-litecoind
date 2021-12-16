

1. Create a volume for the litecoin data.

```
docker volume create --name=litecoind-data
```

All the data the litecoind service needs to work will be stored in the volume.
The volume can then be reused to restore the state of the service in case the container needs to be recreated (in case of a host restart or when upgrading the version).

2. Create and run a container with the `docker-litecoind` image.

```
docker run -d \
    --name litecoind-node \
    -v litecoind-data:/litecoin \
    -p 9333:9333 \
    --restart unless-stopped \
    jsonguyen1/docker-litecoind
```

This will create a container named `litecoind-node` which gets the host's port 9333 forwarded to it.
Also this container will restart in the event it crashes or the host is restarted.

3. Inspect the output of the container by using docker logs

```
docker logs -f litecoind-node
```