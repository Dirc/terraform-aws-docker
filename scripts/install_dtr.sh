#!/usr/bin/env bash

# To avoid port conflicts: let the DTR installation those a free node.


#UCP_DNS=ec2-18-220-77-31.us-east-2.compute.amazonaws.com

UCP_DNS=$1


# Pull the latest version of DTR
sudo docker pull docker/dtr

# Install DTR
sudo docker run -it --rm \
  docker/dtr install \
  --ucp-insecure-tls \
  --ucp-url https://$UCP_DNS \
  --ucp-username admin \
  --ucp-password admin123
