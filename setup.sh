#!/bin/bash

################################################
# Build the Docker image
################################################
docker build ./docker -t apachepulsar/pulsar-mop

################################################
# Start AoP enabled Pulsar in standalone mode
################################################
docker run --name pulsar -dt -p 1883:1883  -p 6650:6650  -p 8080:8080 \
  --mount source=pulsardata,target=/pulsar/data \
  --mount source=pulsarconf,target=/pulsar/conf \
  apachepulsar/pulsar-mop bin/pulsar standalone

################################################
# Wait 15 seconds for Pulsar to start
################################################
sleep 15

################################################
# Create namespace and set policies
################################################
# docker exec -it pulsar /pulsar/bin/pulsar-admin namespaces create -b 1 public/vhost1
# docker exec -it pulsar /pulsar/bin/pulsar-admin namespaces set-retention -s 100M -t 2d  public/vhost1

