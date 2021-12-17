

1. Create a volume for the litecoin data.

```
docker volume create --name=litecoind-data
```

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

4. To kill service

```
docker container ls
docker kill CONTAINERID
docker rm CONTAINERID
```
5. Kubernetes Example - I used Microk8 locally to run the stateful image. Commands are the same as normal kubs(Remove ```microk8s``` from command)

    Watch pod creation 

```
microk8s kubectl get pods -w -l app=litecoin
```  

    
Create the service via the statefulness.yaml


```
microk8s kubectl apply -f statefullness.yaml  microk8s kubectl apply -f statefullness.yaml 
```