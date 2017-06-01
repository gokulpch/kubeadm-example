#!/bin/bash
sudo cp /home/ubuntu/.ssh/authorized_keys /root/.ssh/
sudo -s <<EOF
sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/^StrictModes.*/#StrictModes/g' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo "root:contrail1" | chpasswd
systemctl restart sshd
EOF
