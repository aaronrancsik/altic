#!/usr/bin/env sh

KEYS=us

source ./lib.sh

function myloadkeys(){
    int "Press enter to load keys."
    echo "loadkeys()"
    if [ -n "$KEYS" ]; then loadkeys $KEYS; fi    
}

function updateClock(){
    int "Press enter to update clock."
    echo "updateClock()"
    timedatectl set-ntp true
}

function prepare(){
    int "Press enter to install tmux."
    echo "prepare()"
    pacman -Syy tmux
}

function main(){
    myloadkeys
    updateClock
    prepare
    int "Press enter to start tmux."
    tmux -f tmux.conf new -s install \; split-window -d './step_helper.sh'
}

main $@