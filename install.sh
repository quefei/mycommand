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
USR_COMMAND="myfunction.sh backup-centos backup-mysql backup-policy"
USR_FILE=
ROOT_COMMAND=
ROOT_FILE=
ROOT_DIR="/root/bin"
FILE_DIR="/root/myfile"

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
# download DIR URL1 URL2 FILE1 FILE2 FILE3 ...
download()
{
        local DIR="$1"
        local URL1="$2"
        local URL2="$3"
        local FILE=
        local NUM=
        
        if [[ -z "$DIR" ]]; then
                DIR="/usr/local/bin"
        fi
        
        if [[ -z "$URL1" ]]; then
                URL1="http://git.oschina.net/quefei/mycommand/raw/master"
        fi
        
        if [[ -z "$URL2" ]]; then
                URL2="src"
        fi
        
        mkdir -p ${DIR}
        
        for FILE in "$@"; do
                
                if [[ "$FILE" == "$1" ]] || [[ "$FILE" == "$2" ]] || [[ "$FILE" == "$3" ]]; then
                        continue 1
                fi
                
                local FILE_PATH="${DIR}/${FILE}"
                
                if [[ -f "$FILE_PATH" ]]; then
                        rm -rf "$FILE_PATH"
                fi
                
                for (( NUM=0; NUM < 10; NUM++ )); do
                
                done
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
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
