#!/bin/bash
aws ec2 describe-instances --filters "Name=tag:Name,Values=contrail-K8S-Master" | grep PublicIpAddress | cut -d':' -f2 | tr -d '", ' | xargs -I '{}' sh -c "sshpass -p contrail1 ssh-copy-id -o StrictHostKeyChecking=no root@'{}'; echo '{}'" | xargs -I '{}' ssh root@'{}' sed -ie "s/192.168.0.24/'{}'/g" /root/contrail-ansible/playbooks/inventory/my-inventory/hosts
