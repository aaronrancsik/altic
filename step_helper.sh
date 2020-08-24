#!/usr/bin/env sh

function send2pane(){
    tmux send-keys -t install:0.0 "$1"
}

source ./lib.sh

def_msg="Press Ctr-Space to load the next command."

int "To start execute this: . ./ali "

filename='instructions.txt'
exec 4<$filename
while read -u4 p ; do
    int "$def_msg"
    sleep 1
    send2pane "$p"
done

int "End loop"


