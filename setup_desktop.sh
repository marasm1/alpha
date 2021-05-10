#!/bin/bash
#set variables
read -p "Enter the name for the NIC adapter " nic

#install unzip and lm_sensors
apt install unzip lm-sensors -y

#add line to sshd conf for root login
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

#remove all of cloud-init
echo 'datasource_list: [ None ]' | sudo -s tee /etc/cloud/cloud.cfg.d/90_dpkg.cfg
apt purge cloud-init -y
rm -rf /etc/cloud/ && rm -rf /var/lib/cloud/

#backup netplan file and create new one with correct network data
mv /etc/netplan/00-installer-config.yaml /etc/netplan/00-installer-config.yaml.bak
#create new netplan file
cat > /etc/netplan/00-installer-config.yaml <<EOF
network:
  version: 2
  ethernets:
    $nic:
      dhcp4: true
      optional: true
EOF
sudo netplan apply

#reboot system
reboot now
