# shell_scripts
This repo is for my shell scripts. I use Debian.

The main file is:
## main.sh
Remember to enable exec permission for it (chmod a+x main.sh)
Then you can run it: sudo ./main.sh

It will execute:
## wicd_inst.sh 
It will remove network-manager and install wicd
## packages_inst.sh 
It will install some of the packages I always install on Debian
## macchanger_inst.sh 
It will install macchanger
## tor_inst.sh 
It will install tor


# Interesting sources:

Wicd: https://wiki.archlinux.org/index.php/Wicd#Installation
Macchanger: https://wiki.archlinux.org/index.php/MAC_address_spoofing#macchanger_2
Tor: https://2019.www.torproject.org/docs/debian.html.en

./ vs sh: https://askubuntu.com/questions/22910/what-is-the-difference-between-and-sh-to-run-a-script#22912
Reference a variable in bash script: https://stackoverflow.com/questions/5228345/how-to-reference-a-file-for-variables-using-bash
Set a variable to output of command: https://stackoverflow.com/questions/4651437/how-do-i-set-a-variable-to-the-output-of-a-command-in-bash

