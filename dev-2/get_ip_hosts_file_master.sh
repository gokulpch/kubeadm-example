#!/bin/bash
ip route get 255.255.255.255 | grep -Po '(?<=src )(\d{1,3}.){4}' | xargs -I '{}' sed -i "s/192.168.0.24/{}/g" /root/contrail-ansible/playbooks/inventory/my-inventory/hosts;
ip route get 255.255.255.255 | grep -Po '(?<=src )(\d{1,3}.){4}' | xargs -I '{}' sed -i "s/192.168.0.26/#192.168.0.26/g" /root/contrail-ansible/playbooks/inventory/my-inventory/hosts;
