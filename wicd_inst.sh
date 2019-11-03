#!/bin/bash

source variables.sh

echo "Removing network-manager"
apt purge network-manager
echo "Installing wicd..."
apt install -y wicd

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
wireless_interface = $wifi_interf
wired_interface = $eth_interf
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
