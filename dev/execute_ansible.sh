#!/bin/bash
cd /root/contrail-ansible/playbooks;  ansible-playbook  -i inventory/my-inventory site.yml;
