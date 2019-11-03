#!/bin/bash

source variables.sh

echo "Installing macchanger..."
apt install -y macchanger

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

systemctl enable changemac@$eth_interf.service
systemctl enable changemac@$wifi_interf.service

