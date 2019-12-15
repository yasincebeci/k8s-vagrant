#!/bin/bash

# Creating the config path and giving permission for root
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Configuration for the kmaster stand alone working
kubectl taint nodes --all node-role.kubernetes.io/master-

# Configuration flannel network
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# Display pods
kubectl get pods --all-namespaces

# Creating the config path and giving permission for vagrant
mkdir -p /home/vagrant/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown -R vagrant:vagrant /home/vagrant/.kube

# Cloning git repo
git clone https://github.com/yasincebeci/k8s-vagrant.git

cd k8s-vagrant

# Runing pods and services
kubectl create -f db-pod.yml
kubectl create -f db-svc.yml
kubectl create -f web-pod-.yml
kubectl create -f web-svc.yml

sleep 60

# Displaying ip and port
IP=`kubectl get svc | grep web |sed 's/:/\t/g'|sed 's/\//\t/g'| awk '{print"172.30.130.55:" $6}'`
echo "you can access the page with "${IP}

