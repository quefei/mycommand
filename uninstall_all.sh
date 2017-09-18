#!/bin/bash

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

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

# 全局变量
FILE_LIST="myfunction.sh option.sh
           backup-policy backup-centos backup-mysql
           caw
           quenong
          "

DIR_LIST="/usr/local/bin /root"

# 操作
curl -sS http://git.oschina.net/quefei/mycommand/raw/master/uninstall_part.sh | bash

#
for DIR in ${DIR_LIST}; do
        for FILE in ${FILE_LIST}; do
                
                FILE_PATH="${DIR}/${FILE}"
                
                if [[ -f "$FILE_PATH" ]]; then
                        rm -rf "$FILE_PATH"
                        echo "remove: ${FILE_PATH}"
                fi
                
        done
done
