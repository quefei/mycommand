#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

echoSuccess()    { echo -n -e "\e[0;32mSuccess: \e[0m"; echo $1; }
echoWarning()    { echo -n -e "\e[0;33mWarning: \e[0m"; echo $1; }
echoError()      { echo -n -e "\e[0;31mError: \e[0m"; echo $1; }
displaySuccess() { echo -e "\e[0;32mSuccess\e[0m"; }
displayError()   { echo -e "\e[0;31mError\e[0m"; }

if [ $(id -u) != "0" ]; then
    echoError "must run with root"; exit 1
fi

#
CommandList="mypath"

for Command in $CommandList; do
    CommandFile=/usr/local/bin/$Command
    
    [ -f $CommandFile ] && rm -rf $CommandFile
    
    for (( i = 0; i < 10; i++ )); do
        if [ -s $CommandFile ]; then
            chmod 755 $CommandFile
            break 1
        else
            curl -o $CommandFile http://git.oschina1.net/quefei/mycommand/raw/master/src/$Command
        fi
    done
    
    if (( i == 10 )); then
        echoError "$Command download failed"
        exit 1
    fi
done

displaySuccess
