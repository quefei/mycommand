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

