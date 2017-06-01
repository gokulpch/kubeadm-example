#!/bin/bash
sudo -s <<EOF
sed -i '/Environment="KUBELET_NETWORK_ARGS=/c\#Environment="KUBELET_NETWORK_ARGS=--network-plugin=cni --cni-conf-dir=/etc/cni/net.d --cni-bin-dir=/opt/cni/bin' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf;
systemctl daemon-reload;
systemctl restart kubelet.service;
EOF
