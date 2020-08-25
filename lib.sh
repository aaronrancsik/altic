#!/usr/bin/env sh

function int(){
    read -p "$1"
}

function send2pane(){
    tmux send-keys -t install:0.0 "$1"
}
