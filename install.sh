#!/bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

set -eu
#set -x

if [[ "$(id -u)" != "0" ]]; then
        echo "Error: must run with root"
        exit 1
fi

############################################################
#
#       全局变量
#
############################################################
SHELL_SCRIPT_LIST="backup-centos"

############################################################
#
#       主要操作
#
############################################################
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
                echo "Error: ${SHELL_SCRIPT} download failed"
                exit 1
        fi
        
        if ( ! sed -n "1p" "$SHELL_SCRIPT_PATH" | grep '^#!/bin/bash$' &> /dev/null ); then
                rm -rf "$SHELL_SCRIPT_PATH"
                echo "Warning: ${SHELL_SCRIPT} not found - 404"
                sleep 10
        fi
        
done
