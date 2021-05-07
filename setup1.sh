#!/bin/bash
apt install unzip wpasupplicant
systemctl start wpa_supplicant
systemctl enable wpa_supplicant

#modify following for correct names and locations, add other ones
sed -i 's/#HandleLidClosewhatwver/HandleLidCloseignore' /etc/systems/logind.conf

#add line to sshd conf for root login



#backup netplan file and create new one with correct data
mv /etc/netplan/neplangggg.conf netplanggg.conf.bak
