#!/bin/bash
chmod a+x variables.sh
chmod a+x wicd_inst.sh
chmod a+x packages_inst.sh
chmod a+x macchanger_inst.sh
chmod a+x tor_inst.sh

# This is commented because I installed Debian Gnome instead of Mate
# and I'm not going to use wicd for now.
# echo "Executing wicd_inst.sh ..."
# ./wicd_inst.sh
echo "Executing packages_inst.sh ..."
./packages_inst.sh
echo "Executing macchanger_inst.sh ..."
./macchanger_inst.sh
echo "Executing tor_inst.sh"
./tor_inst.sh
