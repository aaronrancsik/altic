#!/usr/bin/env sh

branch="master"

read -p "Remove possible leftover 'aaronbooster' folder."
rm -rf aaronbooster

read -p "Create new empty 'aaronbooster' folder."
mkdir aaronbooster

read -p "Change into 'aaronbooster' folder."
cd aaronbooster

read -p "Download scripts."
curl --remote-name-all https://raw.githubusercontent.com/aaronrancsik/altic/"$branch"/{instructions.txt,setup.sh,step_helper.sh,ui.sh,tmux.conf}

read -p "Set permissions."
chmod +x {setup,step_helper}.sh

read -p "Execute the installer."
clear
./setup.sh
