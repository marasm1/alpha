#!/bin/bash
#set variables
read -p "Enter the name for the NIC adapter " nic
read -p "Enter the name for the WiFi adapter " wifi
read -p "Enter the WiFi password: " wifipass

#install unzip and wpa_supplicant, start and enable wpa_supplicant
apt install unzip wpasupplicant -y
systemctl start wpa_supplicant
systemctl enable wpa_supplicant

#change settings so laptop lid does not turn off or sleep laptop
sed -i 's/#HandleLidSwitch=whatever/HandleLidSwitch=ignore/' /etc/systemd/logind.conf
sed -i 's/#HandleLidSwitchExternalPower=whatever/HandleLidSitchExternalPower=ignore/' /etc/systemd/logind.conf
sed -i 's/#HandleLidSwitchDocked=whatwver/HandleLidSwitchDocked=ignore/' /etc/systemd/logind.conf

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
    $wifi:
      dhcp4: true
      optional: true
      access-points:
        "green":
          password: "$wifipass"
EOF
sudo netplan apply

#reboot system
reboot now
