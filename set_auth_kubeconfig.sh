#!/bin/bash
sudo cp /etc/kubernetes/admin.conf /home/ubuntu/
sudo chown ubuntu:ubuntu $HOME/admin.conf
#echo export KUBECONFIG"="/home/ubuntu/admin.conf>>~/.profile
#source ~/.profile
echo "export "KUBECONFIG"="/home/ubuntu/admin.conf>>/home/ubuntu/.bashrc
source /home/ubuntu/.bashrc
export KUBECONFIG=$HOME/admin.conf
