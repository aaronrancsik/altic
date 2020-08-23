#!/usr/bin/env sh

function int(){
    read -p "$1"
}

int "Remove possible leftover 'aaronbooster' folder."
rm -rf aaronbooster

int "Create new empty 'aaronbooster' folder."
mkdir aaronbooster

int "Change into 'aaronbooster' folder."
cd aaronbooster

int "Download scripts."
curl --remote-name-all https://raw.githubusercontent.com/aaronrancsik/altic/master/{ali,instructions.txt,setup.sh,step_helper.sh}

int "Set permissions."
chmod +x {setup,step_helper}.sh

int "Execute the installer."
./setup.sh