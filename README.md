# k8s-vagrant

vagrant version 2.2.6 and virtualbox 5.2 used for this project.
you can download applications from  below:
https://www.vagrantup.com/downloads.html
https://www.virtualbox.org/wiki/Download_Old_Builds_5_2

When you want to use this project you need to clone repo from "https://github.com/yasincebeci/k8s-vagrant.git". 

How to use:
1. Install vagrant and virtualbox.
2. clone or download the repo and change the directory to k8s-vagrant.
3. In k8s-vagrant directory type "vagrant up" and wait 5-6 minutes depends on your environment.
4. when the vagrant is done you can check and access web page via ip:port which is given to you on terminal.
5. If you want to access vagrant you should type vagrant ssh in k8s-vagrant dir.
6. If you want to check kubernetes nodes, pods and services you can type "kubectl get pods", "kubectl get nodes" and "kubectl get svc" in your terminal.

mysql pod is running via db-pod.yml and db-svc.yml. the image is mysql:latest.
web pod is running via web-pod.yml and web-svc.tml files. the image yasincebeci/p2a37 on docker hub. this image created with python 2.7, alpine 3.7 and app.py. you can find the Dockerfile in the k8s-vagrant dir.  
