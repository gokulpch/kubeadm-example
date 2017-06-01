#!/bin/bash
ansible-playbook /root/kubeadm-example/create_keypair.yml
eval `ssh-agent -s`;
ssh-add ~/.ssh/k8s-keypair.pem;
bash -i
