#!/bin/bash
master="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Master" | grep PublicIpAddress | cut -d':' -f2 | tr -d '", ')"

slave="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Minion" | grep PublicIpAddress | cut -d':' -f2 | tr -d '", ')"

echo MASTER: "${master}"
echo MINION: "${slave}"

ssh -tt root@"${master}" << EOF
 yes | ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
 apt-get install sshpass -y
 sshpass -p contrail1 ssh-copy-id -o 'StrictHostKeyChecking=no' root@"${slave}"
 sshpass -p contrail1 ssh-copy-id -o 'StrictHostKeyChecking=no' root@"${master}"
exit 0
EOF
exit 0
