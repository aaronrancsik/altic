#!/usr/bin/env sh

read -p "Remove possible leftover 'aaronbooster' folder."
rm -rf aaronbooster

read -p "Create new empty 'aaronbooster' folder."
mkdir aaronbooster

read -p "Change into 'aaronbooster' folder."
cd aaronbooster

read -p "Download scripts."
curl --remote-name-all https://raw.githubusercontent.com/aaronrancsik/altic/master/{ali,instructions.txt,setup.sh,step_helper.sh,lib.sh,tmux.conf}

read -p "Set permissions."
chmod +x {setup,step_helper}.sh

int "Execute the installer."
./setup.sh