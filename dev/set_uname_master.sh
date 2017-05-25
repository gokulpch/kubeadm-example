#!/bin/bash
sudo -s <<EOF
hostnamectl set-hostname master
echo "127.0.0.1 master">>/etc/hosts
EOF
