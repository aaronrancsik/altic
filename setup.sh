#!/usr/bin/env sh

KEYS=us

source ./lib.sh

function myloadkeys(){
    int "loadkeys $KEYS [Y|n]"
    loadkeys $KEYS
}

function updateClock(){
    int "timedatectl set-ntp true [Y|n]"
    timedatectl set-ntp true
}

function installTmux(){
    int "pacman -Syy tmux [Y|n]"
    pacman -Syy tmux
}

function main(){
    echo "Prepare ALTIC..."
    myloadkeys
    updateClock
    installTmux
    int "Start ALTIC Tmux session called 'install' [Y|n]"
    tmux -f tmux.conf new -s install \; split-window -v -d './step_helper.sh'
}

main $@