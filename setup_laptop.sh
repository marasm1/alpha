#!/bin/bash
#set variables
read -p "Enter the name for the NIC adapter " nic
read -p "Enter the name for the WiFi adapter " wifi
read -p "Enter the WiFi password: " wifipass

#install unzip and wpa_supplicant, start and enable wpa_supplicant
apt install unzip wpasupplicant
systemctl start wpa_supplicant
systemctl enable wpa_supplicant

#modify following for correct names and locations, add other ones
sed -i 's/#HandleLidSwitch=whatever/HandleLidSwitch=ignore' /etc/systemd/logind.conf
sed -i 's/#HandleLidSwitchExternalPower=whatever/HandleLidSitchExternalPower=ignore' /etc/systemd/logind.conf
sed -i 's/#HandleLidSwitchDocked=whatwver/HandleLidSwitchDocked=ignore' /etc/systemd/logind.conf


#add line to sshd conf for root login
sed -i 's/#PermitRootLogin prohibit-password /PermitRootLogin yes' /etc/ssh/sshd_config

#remove all of cloud-init


#backup netplan file and create new one with correct data
mv /etc/netplan/00-installer-config.yaml /etc/netplan/00-installer-config.yaml.bak
#create new netplan file
cat > /etc/netplan/00-installer-config.yaml <<EOF
network:
  version: 2
  ethernets:
    $nic
      dhcp4: true
      optional:true
    $wifi
      dhcp4: true
      optional: true
      access-points:
        "green":
          password: "$wifipass"
EOF
sudo netplan apply

#reboot system
reboot now
