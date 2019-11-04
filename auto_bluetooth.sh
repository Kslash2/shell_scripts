#!/bin/bash

# enable bluetooth
systemctl start bluetooth

sleep 1

echo 'power on\nconnect 34:88:\t\n' | bluetoothctl

sleep 5

echo 'quit' | bluetoothctl
