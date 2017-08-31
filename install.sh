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
SHELL_SCRIPT_LIST="myfunction.sh backup-centos backup-mysql"

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
        fi
        
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
                echo_error "Error: ${SHELL_SCRIPT} download failed"
        fi
        
        if ( ! sed -n "1p" "$SHELL_SCRIPT_PATH" | grep '^#!/bin/bash$' &> /dev/null ); then
                rm -rf "$SHELL_SCRIPT_PATH"
                echo_warning "Warning: ${SHELL_SCRIPT} not found - 404"
        fi
        
done

############################################################
#
#       8.结束语
#
############################################################