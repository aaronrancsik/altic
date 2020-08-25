#!/usr/bin/env sh

source ./lib.sh

def_msg="Press Ctr-Space to continue."

filename='instructions.txt'
i="0"
lines=$(wc -l < "$filename")

while [ "$i" -le "$lines" ]; do
    clear
    echo ""
    echo "Last loaded command: $i"'/'"$lines"
    (( i++ ))
    int "$def_msg"
    send2pane "$(sed $i'q;d' $filename)"
done

int "End loop"