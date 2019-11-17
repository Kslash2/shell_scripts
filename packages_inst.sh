#!/bin/bash

source variables.sh

echo "Updating sources..."
echo "$CODENAME"

echo "# See https://wiki.debian.org/SourcesList for more information.
deb http://deb.debian.org/debian $CODENAME main contrib non-free
deb-src http://deb.debian.org/debian $CODENAME main contrib non-free

deb http://deb.debian.org/debian $CODENAME-updates main contrib non-free
deb-src http://deb.debian.org/debian $CODENAME-updates main contrib non-free

deb http://security.debian.org/debian-security/ $CODENAME/updates main contrib non-free
deb-src http://security.debian.org/debian-security/ $CODENAME/updates main contrib non-free" > /etc/apt/sources.list

echo "Running update..."
apt update
echo "Running upgrade..."
apt upgrade

packages_list="gnome-icon-theme
               moka-icon-theme
               numix-icon-theme
               moka-icon-theme
               numix-gtk-theme
               arc-theme
               git
               transmission
               python3-dev
               python3-pip
               python3-setuptools
               hexchat
               wget
               software-properties-common 
               apt-transport-https
               curl
               openssh-client
               vlc
               haskell-platform
               haskell-stack
               default-jdk
               arduino"

echo "Installing packages..."
apt install -y $packages_list
pip3 install thefuck
