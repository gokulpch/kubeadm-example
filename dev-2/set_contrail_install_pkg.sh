#! /bin/sh
#git clone -b R4.0 https://github.com/Juniper/contrail-ansible.git
wget https://s3-us-west-2.amazonaws.com/contrail-docker-images/contrail-ansible.tgz;
wget https://s3-us-west-2.amazonaws.com/contrail-docker-images/contrail-kubernetes-docker-images_4.0.0.0-15.tgz;
tar -xvzf contrail-ansible.tgz;
rm -rf contrail-ansible.tgz;
mkdir /root/contrail-ansible/playbooks/container_images;
tar -xvzf /root/contrail-kubernetes-docker-images_4.0.0.0-15.tgz -C /root/contrail-ansible/playbooks/container_images/.;
#tar -xvzf /root/contrail-ansible/playbooks/container_images/contrail-kubernetes-docker-images_4.0.0.0-11.tgz -C /root/contrail-ansible/playbooks/container_images/.;
rm -rf contrail-kubernetes-docker-images_4.0.0.0-15.tgz;
echo "Done"
