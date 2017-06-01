#!/bin/bash
sed -i "s/insecure-port=0/insecure-port=8080/g" /root/contrail-ansible/playbooks/inventory/my-inventory/hosts /etc/kubernetes/manifests/kube-apiserver.yaml;
sed -i "28i\    - --insecure-bind-address=0.0.0.0" /etc/kubernetes/manifests/kube-apiserver.yaml;
sudo service kubelet restart;
