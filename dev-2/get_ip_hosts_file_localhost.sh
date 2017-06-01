#!/bin/bash
master="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Master" | grep PublicIpAddress | cut -d':' -f2 | tr -d '", ')"

slave="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Minion" | grep "\<PrivateIpAddress\>" | cut -d':' -f2 | tr -d '", ' | sort -u)"

echo MASTER: "${master}"
echo MINION: "${slave}"

ssh -tt -o StrictHostKeyChecking=no root@"${master}" << EOF
 sed -i "s/192.168.0.25/$slave/g" /root/contrail-ansible/playbooks/inventory/my-inventory/hosts;
exit 0
EOF
exit 0
