#!/bin/bash
master_public="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Master" | grep PublicIpAddress | cut -d':' -f2 | tr -d '", ')"

master_private="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Master" | grep "\<PrivateIpAddress\>" | cut -d':' -f2 | tr -d '", ' | sort -u)"

slave_private="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Minion" | grep "\<PrivateIpAddress\>" | cut -d':' -f2 | tr -d '", ' | sort -u)"

echo MASTER-Public: "${master_public}"
echo MASTER-Private: "${master_private}"
echo MINION-Private: "${slave_private}"

ssh -tt root@"${master_public}" << EOF
 yes | ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
 apt-get install sshpass -y
 sshpass -p contrail1 ssh-copy-id -o 'StrictHostKeyChecking=no' root@"${slave_private}"
 sshpass -p contrail1 ssh-copy-id -o 'StrictHostKeyChecking=no' root@"${master_private}"
exit 0
EOF
exit 0
