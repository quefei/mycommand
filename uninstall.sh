#!/bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

############################################################
#
#       1.位置参量
#
############################################################

set -eu
#set -x

echo_color()
{
        echo -e "\e[1m\e[40;$2m$1\e[0m"
}

echo_error()
{
        echo_color "$1" "31"
        exit 1
}

echo_warning()
{
        echo_color "$1" "33"
        sleep 5
}

if [[ "$(id -u)" != "0" ]]; then
        echo_error "Error: must run with root"
fi

############################################################
#
#       2.全局变量
#
############################################################
SHELL_SCRIPT_LIST="myfunction.sh backup-centos backup-mysql backup-policy"

CONFIG_FILE_LIST="/root/.backup-mysql.conf \
                  /root/.my.cnf"

CONFIG_DIR_LIST=

############################################################
#
#       3.初始化
#
############################################################

############################################################
#
#       4.次要函数
#
############################################################

############################################################
#
#       5.主要函数
#
############################################################

############################################################
#
#       6.次要操作
#
############################################################

############################################################
#
#       7.主要操作
#
############################################################
for SHELL_SCRIPT in ${SHELL_SCRIPT_LIST}; do
        
        SHELL_SCRIPT_PATH=/usr/local/bin/${SHELL_SCRIPT}
        
        if [[ -f "$SHELL_SCRIPT_PATH" ]]; then
                rm -rf "$SHELL_SCRIPT_PATH"
                echo "remove file: ${SHELL_SCRIPT_PATH}"
        fi
        
done

for CONFIG_FILE in ${CONFIG_FILE_LIST}; do
        if [[ -f "$CONFIG_FILE" ]]; then
                rm -rf "$CONFIG_FILE"
                echo "remove file: ${CONFIG_FILE}"
        fi
done

############################################################
#
#       8.结束语
#
############################################################
