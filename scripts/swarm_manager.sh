#!/usr/bin/env bash

echo
echo "Setup Swarm Manager"
echo

sudo docker swarm init

echo "Save token in file"
sudo docker swarm join-token --quiet worker > /home/ubuntu/token