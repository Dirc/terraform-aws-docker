#!/usr/bin/env bash

#PUBLIC_IP=18.222.139.227
#PUBLIC_HOSTNAME=ec2-18-222-139-227.us-east-2.compute.amazonaws.com

PUBLIC_IP=$1
PUBLIC_HOSTNAME=$2

docker container run \
  --rm \
  -it \
  --name ucp \
  -v /var/run/docker.sock:/var/run/docker.sock \
  docker/ucp \
  install \
  --admin-username admin \
  --admin-password admin123 \
  --host-address $(hostname -i) \
  --san ${PUBLIC_HOSTNAME},${PUBLIC_IP}



docker container run \
  --rm \
  -it \
  --name ucp \
  -v /var/run/docker.sock:/var/run/docker.sock \
  docker/ucp \
  install \
  --admin-username admin \
  --admin-password admin123 \
  --host-address $(hostname -i) \
  --san ${aws_instance.master.public_ip},${aws_instance.master.public_dns}
