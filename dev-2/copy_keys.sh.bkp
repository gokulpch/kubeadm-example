#!/bin/bash
master="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Master" | grep PublicIpAddress | cut -d':' -f2 | tr -d '", ' | xargs -I '{}' sh -c "sshpass -p contrail1 ssh-copy-id -o StrictHostKeyChecking=no root@'{}'; echo '{}'" | xargs -I '{}' sh -c "ssh root@'{}' sed -ie "s/192.168.0.24/'{}'/g" /root/contrail-ansible/playbooks/inventory/my-inventory/hosts; echo '{}'")"

slave="$(aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Minion" | grep PublicIpAddress | cut -d':' -f2 | tr -d '", ')"

echo MASTER: "${master}"
echo MINION: "${slave}"

ssh -tt root@"${master}" << EOF
 yes | ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
 apt-get install sshpass -y
 sshpass -p contrail1 ssh-copy-id -o 'StrictHostKeyChecking=no' root@"${slave}"
exit 0
EOF
exit 0
