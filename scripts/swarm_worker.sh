#!/usr/bin/env bash

echo
echo "Setup Swarm Worker"
echo

master_private_ip=$1
echo "Master ip: ${master_private_ip}"

echo "Get token from master"
sudo chmod 400 /home/ubuntu/key.pem
sudo scp \
  -o StrictHostKeyChecking=no \
  -o NoHostAuthenticationForLocalhost=yes \
  -o UserKnownHostsFile=/dev/null \
  -i key.pem \
  ubuntu@${master_private_ip}:/home/ubuntu/token .

echo "Join Swarm"
sudo docker swarm join --token $(cat /home/ubuntu/token) ${master_private_ip}:2377
