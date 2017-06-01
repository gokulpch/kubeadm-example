#!/bin/bash
aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Master" | grep PublicIpAddress | cut -d':' -f2 | tr -d '", ' | xargs -I '{}' sh -c "sshpass -p contrail1 ssh-copy-id -o StrictHostKeyChecking=no root@'{}'; echo '{}'" | xargs -I '{}' ssh root@'{}' sed -i "s/192.168.0.24/'{}'/g" /root/contrail-ansible/playbooks/inventory/my-inventory/hosts;
aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Master" | grep PublicIpAddress | cut -d':' -f2 | tr -d '", ' | xargs -I '{}' sh -c "sshpass -p contrail1 ssh-copy-id -o StrictHostKeyChecking=no root@'{}'; echo '{}'" | xargs -I '{}' ssh root@'{}' sed -i "s/192.168.0.26/#192.168.0.26/g" /root/contrail-ansible/playbooks/inventory/my-inventory/hosts;

master="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Master" | grep PublicIpAddress | cut -d':' -f2 | tr -d '", ')"

slave="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Minion" | grep PublicIpAddress | cut -d':' -f2 | tr -d '", ')"

echo MASTER: "${master}"
echo MINION: "${slave}"

ssh -tt root@"${master}" << EOF
 sed -i "s/192.168.0.25/$slave/g" /root/contrail-ansible/playbooks/inventory/my-inventory/hosts;
exit 0
EOF
exit 0
