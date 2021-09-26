#!/usr/bin/env sh

source ./ui.sh

TCOLS=$(tput cols)
DEFAULT_INST='instructions.txt'
CURRENT_FILENAME= "${1:-DEFAULT_INST}" 

NLINE=$(wc -l < "$CURRENT_FILENAME")
i="1"

function helpOut(){
    printfh3 "Ctrl + Space   paste & move        ╔═╗╦ ╔╦╗╦╔═╗"
    printfh3 "Ctrl +   ]     move next           ║ ║║  ║ ║║  "
    printfh3 "Ctrl +   [     move back           ╠═╣║  ║ ║║  "
    printfh3 "Ctrl +   j     paste highlighted   ╩ ╩╩═╝╩ ╩╚═╝"
}



function redraw() {
    clear

    printProgress "$i" "$NLINE"

    tput setaf 7
    printf "      SCRIPT:"
    tput sgr0
    echo " $CURRENT_FILENAME"

    tput setaf 7
    printf "     COMMENT:"
    tput sgr0
    echo " $(sed $i'q;d' $CURRENT_FILENAME | sed 's|.*\#||')"
    
    HIGHLIGHTED="$(sed $i'q;d' $CURRENT_FILENAME | sed 's|\(.*\)#.*|\1|')"

    tput setaf 7
    printf " HIGHLIGHTED:"
    tput sgr0
    echo " $HIGHLIGHTED"
    
    verticalCenter
    helpOut
    
    local ret
    read ret

    if [[ "$ret" == "p" ]]; then
        (( i++ ))
    elif [[ "$ret" == "m" && $i > 1 ]]; then
        (( i-- ))
    elif [[ "$ret" == "i" ]]; then
        send2pane "$HIGHLIGHTED"
    elif [[ "$ret" == "s" ]]; then
        send2pane "$HIGHLIGHTED"
        (( i++ ))
    fi
}

while [ "$i" -le "$NLINE" ]; do
    redraw
done

int "Everything done."
