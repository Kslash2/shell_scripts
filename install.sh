#!/bin/bash

apt purge network-manager

echo "Installing wicd..."
apt install -y wicd

wifi_interf="$(ls /sys/class/net | grep "^w")"
eth_interf="$(ls /sys/class/net | grep "^e")"

echo "#!/usr/bin/env bash

connection_type="$1"

if [[ "${connection_type}" == "wireless" ]]; then
        ip link set $wifi_interf down
        macchanger -A $wifi_interf
        ip link set $wifi_interf up
elif [[ "${connection_type}" == "wired" ]]; then
        ip link set $eth_interf down
        macchanger -A $eth_interf
        ip link set $eth_interf up
fi" > /etc/wicd/scripts/preconnect/macchange.sh


echo "[Settings]
backend = external
wireless_interface = wlp3s0
wired_interface = enp0s25
wpa_driver = wext
always_show_wired_interface = False
use_global_dns = True
global_dns_1 = 208.67.222.222
global_dns_2 = 208.67.220.220
global_dns_3 = 208.67.222.220 
global_dns_dom = None
global_search_dom = None
auto_reconnect = True
debug_mode = 0
wired_connect_mode = 1
signal_display_type = 0
should_verify_ap = 1
dhcp_client = 0
link_detect_tool = 0
" > /etc/wicd/manager-settings.conf


/etc/init.d/wicd start


packages_list="gnome-icon-theme
moka-icon-theme
numix-icon-theme
moka-icon-theme
numix-gtk-theme
arc-theme
vlc
hexchat
wget
software-properties-common 
apt-transport-https
curl
openssh-client
macchanger
"

echo "Running update..."
apt update
echo "Running upgrade..."
apt upgrade

echo "Installing packages..."
apt install -y $packages_list

# This commented code is made for running macchanger without using wicd
# it is commented because I discovered on ArchLinux wiki (Love it <3)
# that wicd already works with macchanger, so I commented this part
echo "Running macchanger setup"
echo "[Unit]
Description=macchanger on %I
Wants=network.target
Before=network.target
BindsTo=sys-subsystem-net-devices-%i.device
After=sys-subsystem-net-devices-%i.device

[Service]
Type=oneshot
ExecStart=/usr/bin/macchanger -r %I
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/changemac@.service

systemctl enable changemac@enp0s25.service
systemctl enable changemac@wlp3s0.service

