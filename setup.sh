#!/usr/bin/env sh

KEYS=us

function int(){
    read -p "$1"
}

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
    tmux new -s install \; split-window -d './step_helper.sh'
}

main $@