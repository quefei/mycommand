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
USR_COMMAND=
USR_FILE=
ROOT_COMMAND=
ROOT_FILE=
USR_DIR="/usr/local"
ROOT_DIR="/root"

############################################################
#
#       3.初始化
#
############################################################
mkdir -p ${ROOT_DIR}/{"bin","myfile"}

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
download()
{
        local FILE=
        
        for FILE in "$@"; do
        
        done
}

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

############################################################
#
#       8.结束语
#
############################################################
