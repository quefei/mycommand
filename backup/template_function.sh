#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

echoColor()      { echo -e "\e[1m\e[$3;$2m$1\e[0m"; }
echoLine()       { echo -n $(echoColor "$1" "$2" "$3" ); }
echoSuccess()    { echo $(echoLine "Success: " "32" "40")$(echoColor "$1" "37" "40"); }
echoWarning()    { echo $(echoLine "Warning: " "33" "40")$(echoColor "$1" "37" "40"); }
echoError()      { echo $(echoLine "Error: " "31" "40")$(echoColor "$1" "37" "40"); }
displaySuccess() { echo $(echoColor "Success" "32" "40"); }
displayError()   { echo $(echoColor "Error" "31" "40"); }

if [ $(id -u) != "0" ]; then
    echoError "must run with root"; exit 1
fi

if [ -s /usr/local/bin/myfunction.sh ]; then
    . /usr/local/bin/myfunction.sh
else
    echoError "myfunction.sh not found"; exit 1
fi

#
