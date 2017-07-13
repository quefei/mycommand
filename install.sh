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

#
CommandList="mytest quenong-md5 myfunction.sh mypath mydir mymake mydown mytime myopt"

for Command in $CommandList; do
    CommandFile=/usr/local/bin/$Command
    
    [ -f $CommandFile ] && rm -rf $CommandFile
    
    for (( i = 0; i < 10; i++ )); do
        if [ -s $CommandFile ]; then
            [[ $Command != "myfunction.sh" ]] && chmod 755 $CommandFile
            break 1
        else
            curl -o $CommandFile http://git.oschina.net/quefei/mycommand/raw/master/src/$Command
        fi
    done
    
    if (( i == 10 )); then
        echoError "$Command download failed"
        exit 1
    fi
    
    if ( sed -n "1p" $CommandFile | grep '^#!/bin/bash$' &> /dev/null ); then
        :
    else
        rm -rf $CommandFile
        echoWarning "$Command is not MyCommand"
    fi
done
