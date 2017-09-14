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
FILE_LIST="test-command one-key config-install config-centos install-lnmp install-nodejs install-laravel config-laravel install-cobbler
           epel.repo lnmp1.4.tar.gz nginx.conf fastcgi.conf php.ini composer
           tftp settings dhcp.template pxedefault.template pxeprofile.template dhcpd.conf sample_end.ks
           .my.cnf .lnmp.status .selinux.status
          "

DIR_LIST=" /root /root/bin /root/myfile"

DIR_LIST2="/root/bin /root/myfile"

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
for DIR in ${DIR_LIST}; do
        for FILE in ${FILE_LIST}; do
                
                FILE_PATH="${DIR}/${FILE}"
                
                if [[ -f "$FILE_PATH" ]]; then
                        rm -rf "$FILE_PATH"
                        echo "remove: ${FILE_PATH}"
                fi
                
        done
done

for DIR in ${DIR_LIST2}; do
        
        if [[ -d "$DIR" ]]; then
                cd "$DIR"
                
                if [[ -z "$(ls -A)" ]]; then
                        rm -rf "$DIR"
                else
                        echo_warning "Warning: ${DIR} is not empty"
                fi
        fi
        
done

############################################################
#
#       8.结束语
#
############################################################
