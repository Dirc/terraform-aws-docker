#!/usr/bin/env bash
sudo apt-get update

echo "Install required utils"
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common


echo "Install Docker"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
# Latest Docker
sudo apt install -y docker-ce
# Specific version
#sudo apt-get install -y docker-ce=17.06.2~ce-0~ubuntu


echo "Starting Docker..."
sudo systemctl enable docker && sudo systemctl start docker


echo "Add user to docker group"
sudo usermod -aG docker $USER


echo "Run docker version as non-root user:"
docker --version