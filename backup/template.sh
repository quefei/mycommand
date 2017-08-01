#!/bin/bash

if [[ "$(id -u)" != "0" ]]; then
        echo -n -e "\e[1m\e[40;31mError: \e[0m"
        echo -e "\e[1m\e[40;37mmust run with root\e[0m"
        exit 1
fi

SHELL_SCRIPT_LIST="myfunction.sh quenong_function.sh"

for SHELL_SCRIPT in ${SHELL_SCRIPT_LIST}; do
        SHELL_SCRIPT_PATH=/usr/local/bin/${SHELL_SCRIPT}
        
        if [[ -s "$SHELL_SCRIPT_PATH" ]]; then
                . "$SHELL_SCRIPT_PATH"
        else
                echo -n -e "\e[1m\e[40;31mError: \e[0m"
                echo -e "\e[1m\e[40;37m${SHELL_SCRIPT} not found\e[0m"
                exit 1
        fi
done

#

