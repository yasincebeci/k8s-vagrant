#!/bin/bash

# Update hosts file
echo "Updating /etc/hosts file"
cat >>/etc/hosts<<EOF
172.30.130.55 kubernetesmaster.com
EOF

# Disable swap
echo "Disabling and turn off SWAP"
sudo swapoff -a

# Install docker from Docker-ce repository
echo "Installing docker container engine"
sudo apt-get install docker-ce > /dev/null 2>&1
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce -y

# check status of docker service
echo "checking status of docker service"
sudo systemctl status docker

# Install kubectl, kubelet and kubeadm
sudo apt-get update
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni
sudo sysctl net.bridge.bridge-nf-call-iptables=1
sudo kubeadm init --apiserver-advertise-address=172.30.130.55 --pod-network-cidr=10.244.0.0/16

# Update vagrant user's bashrc file
echo "export TERM=xterm" >> /etc/bashrc