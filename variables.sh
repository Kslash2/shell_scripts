#!/bin/bash

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    CODENAME=$VERSION_CODENAME
    
fi

wifi_interf="$(ls /sys/class/net | grep "^w")"
eth_interf="$(ls /sys/class/net | grep "^e")"