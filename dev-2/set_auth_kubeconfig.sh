#!/bin/bash
sudo cp /etc/kubernetes/admin.conf /root/.
sudo chown root:root $HOME/admin.conf
#echo export KUBECONFIG"="/home/ubuntu/admin.conf>>~/.profile
#source ~/.profile
echo "export "KUBECONFIG"="/root/admin.conf>>/root/.bashrc
source /root/.bashrc
export KUBECONFIG=$HOME/admin.conf
