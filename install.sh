#!/bin/bash

if [[ "$(id -u)" != "0" ]]; then
        echo -n -e "\e[1m\e[40;31mError: \e[0m"
        echo -e "\e[1m\e[40;37mmust run with root\e[0m"
        exit 1
fi

#
SHELL_SCRIPT_LIST="myfunction.sh quenong_function.sh"

for SHELL_SCRIPT in ${SHELL_SCRIPT_LIST}; do
        SHELL_SCRIPT_PATH=/usr/local/bin/${SHELL_SCRIPT}
        
        [[ -f "$SHELL_SCRIPT_PATH" ]] && rm -rf "$SHELL_SCRIPT_PATH"
        
        for (( NUM=0; NUM < 10; NUM++ )); do
                if [[ -s "$SHELL_SCRIPT_PATH" ]]; then
                        if ( ! echo "$SHELL_SCRIPT" | grep ".sh$" &> /dev/null ); then
                                chmod 755 "$SHELL_SCRIPT_PATH"
                        fi
                        
                        break 1
                else
                        curl -o "$SHELL_SCRIPT_PATH" http://git.oschina.net/quefei/mycommand/raw/master/src/${SHELL_SCRIPT}
                fi
        done
        
        if [[ "$NUM" == "10" ]]; then
                echo -n -e "\e[1m\e[40;31mError: \e[0m"
                echo -e "\e[1m\e[40;37m${SHELL_SCRIPT} download failed\e[0m"
                exit 1
        fi
        
        if ( ! sed -n "1p" "$SHELL_SCRIPT_PATH" | grep '^#!/bin/bash$' &> /dev/null ); then
                rm -rf "$SHELL_SCRIPT_PATH"
                echo -n -e "\e[1m\e[40;33mWarning: \e[0m"
                echo -e "\e[1m\e[40;37m${SHELL_SCRIPT} not found - 404\e[0m"
        fi
done
