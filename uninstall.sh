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
echo "Remove File:"

for SHELL_SCRIPT in ${SHELL_SCRIPT_LIST}; do
        
        SHELL_SCRIPT_PATH=/usr/local/bin/${SHELL_SCRIPT}
        
        if [[ -f "$SHELL_SCRIPT_PATH" ]]; then
                rm -rf "$SHELL_SCRIPT_PATH"
                echo "$SHELL_SCRIPT_PATH"
        fi
        
done

echo ""
