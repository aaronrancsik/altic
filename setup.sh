#!/usr/bin/env sh

KEYS=us

source ./ui.sh

function myloadkeys(){
    yesNoQuestion "exec: loadkeys $KEYS";
    if [[ $? -eq "0" ]]; then
        loadkeys $KEYS
    fi
}

function updateClock(){
    yesNoQuestion "exec: timedatectl set-ntp true";
    if [[ $? -eq "0" ]]; then
        timedatectl set-ntp true
    fi
    
}

function installTmux(){
    yesNoQuestion "exec: pacman -Syy tmux";
    if [[ $? -eq "0" ]]; then
        pacman -Syy tmux
    fi
}

function main(){
    echo "Prepare ALTIC..."
    myloadkeys
    updateClock
    installTmux
    yesNoQuestion "Start ALTIC Tmux session called 'install'"
    if [[ $? -eq "0" ]]; then
        tmux -f tmux.conf new -s install \; split-window -v -d './step_helper.sh' $1
    fi
}

main $@
