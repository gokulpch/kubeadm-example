#!/bin/bash
sudo -s <<EOF
hostnamectl set-hostname node
echo "127.0.0.1 node">>/etc/hosts
EOF
