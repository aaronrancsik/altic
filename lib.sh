#!/usr/bin/env sh

PRIMARYBG="7"
PRIMARYFG="7"
SECONDARYFG="8"

function send2pane(){
    tmux send-keys -t install:0.0 "$1"
}

function verticalCenter(){
    local height=$(tput lines)
    tput cup $(( ( height / 2 + 1 ) )) 0
}

function getWidth(){
    echo "$(tput cols)"
}

function getSpace(){
    local TCOLS=$(getWidth)
    echo $((  $TCOLS / 2 - ( ${#1} / 2 )  ))
}

function printfProgressState(){
    local CUR="$1"
    local TOT="$2"
    printf "%s%03d%s%03d%s" ' ' "$CUR" ' \ ' "$TOT" ' '
}

function printfh1(){
    local TCOLS=$(getWidth)
    local SPACE=$(getSpace "$1")

    tput setab $PRIMARYBG
    tput bold
    printf '%*s'"$1" $SPACE
    printf '%*s\n' $(($TCOLS - ( $SPACE + ${#1} ) ))

    tput sgr 0
}

function printProgress(){
    local TCOLS=$(getWidth)
    local CUR="$1"
    local TOT="$2"
    local PERCENT=$((100/$TOT*$CUR))
    local STR=$(printfProgressState "$CUR" "$TOT")
    local SPACE=$(getSpace "$STR")
    
    local BAR_BEGIN=$( printf '%*s' "$SPACE" )
    BAR_BEGIN="${BAR_BEGIN// /▂}"
    
    local BAR_END=$(printf '%*s' $(( $TCOLS - ($SPACE + ${#STR}) )) )
    BAR_END="${BAR_END// /▂}"
    
    local BAR="$BAR_BEGIN""$STR""$BAR_END"
    
    local PROGRES_NUMBER=$((${#BAR}*$PERCENT/$TOT))

    tput setaf $SECONDARYFG
    tput bold
    tput smul
    printf %s "${BAR:0:$PROGRES_NUMBER}"

    tput sgr0
    tput setaf $PRIMARYFG
    tput bold
    tput smul
    printf %s "${BAR:$PROGRES_NUMBER:$TCOLS}"
    tput sgr 0
}

function printfh3(){
    local TCOLS=$(getWidth)
    local SPACE=$(getSpace "$1")

    printf '%*s'"$1" $SPACE 
    printf '%*s' $(( $TCOLS - ( $SPACE + ${#1} ) ))
    tput sgr 0
}

function int(){
    read -p "$1"
}

function yesNoQuestion(){
    local ans="a"
    while [[ "$ans" != "Y" && "$ans" != "N" && "$ans" != ""  ]]; do
        tput bold
        printf "$1 [Y/n] " 
        read ans
        ans="${ans^^}" 
    done
    if [[ "$ans" == "Y" || "$ans" == "" ]]; then
        return 0;
    fi
    return 1
}
