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


