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
USR_COMMAND="myfunction.sh option.sh backup-centos backup-mysql backup-policy config-network \
             caw"
USR_FILE=
ROOT_COMMAND="one-key config-install config-centos install-lnmp install-nodejs install-laravel install-cobbler"
ROOT_FILE="epel.repo lnmp1.4.tar.gz nginx.conf fastcgi.conf php.ini composer \
           tftp settings dhcp.template pxedefault.template pxeprofile.template dhcpd.conf sample_end.ks"
ROOT_DIR="/root/bin"
FILE_DIR="/root/myfile"
EXCEPT_FILE_LIST="tftp settings"
MD5="1d0e91c5c6b54a7ee57ddedbcf04ef2c"

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
change_ip()
{
        # 网关          ###111.111.111.111###
        local GATEWAY=$(ip -o route | grep "^default" | awk '{ print $3 }')
        local GATEWAY_TAIL=$(echo "$GATEWAY" | awk -F. '{ print $4 }')
        
        # 网段          ###000.000.000###
        local LAN=$(echo "$GATEWAY" | sed "s/\.${GATEWAY_TAIL}$//g")
        
        # IP            ###555.555.555.555###
        local IPADDR=$(ip -o addr | grep "inet ${LAN}\.[0-9]" | awk '{ print $4 }' | awk -F/ '{ print $1 }')
        local IPADDR_TAIL=$(echo "$IPADDR" | awk -F. '{ print $4 }')
        
        # IP +1         ###666.666.666.666###
        local IPADDR1="${LAN}.$((IPADDR_TAIL+1))"
        
        local CONFIG_FILE=
        local CONFIG_FILE_PATH=
        
        for CONFIG_FILE in "settings" "dhcp.template" "dhcpd.conf" "sample_end.ks"; do
                CONFIG_FILE_PATH=/root/myfile/${CONFIG_FILE}
                
                sed -i "s/###111\.111\.111\.111###/${GATEWAY}/g" ${CONFIG_FILE_PATH}
                sed -i "s/###000\.000\.000###/${LAN}/g"          ${CONFIG_FILE_PATH}
                sed -i "s/###555\.555\.555\.555###/${IPADDR}/g"  ${CONFIG_FILE_PATH}
                sed -i "s/###666\.666\.666\.666###/${IPADDR1}/g" ${CONFIG_FILE_PATH}
        done
}

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
                        
                        if [[ -s "$FILE_PATH" ]] \
                        && (  ! grep "^<title>" "$FILE_PATH" &> /dev/null ) \
                        && (  ! grep "^404" "$FILE_PATH" &> /dev/null ); then
                                break 1
                        else
                                curl -sSo "$FILE_PATH" ${URL1}/${URL2}/${FILE}
                        fi
                        
                done
                
                if [[ "$NUM" == "10" ]]; then
                        echo_error "Error: ${FILE} download failed"
                fi
                
                if ( ! echo "$FILE" | grep "\." &> /dev/null ); then
                        chmod 755 "$FILE_PATH"
                fi
                
                echo "download: ${FILE}"
                
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
#
download ""          "" ""       ${USR_COMMAND}

download "$ROOT_DIR" "" ""       ${ROOT_COMMAND}

download "$FILE_DIR" "" "myfile" ${ROOT_FILE}

#download "$FILE_DIR" "" "myfile" ${USR_FILE}

#
change_ip

#
for EXCEPT_FILE in ${EXCEPT_FILE_LIST}; do
        chmod 644 ${FILE_DIR}/${EXCEPT_FILE}
done

#
if [[ -s "/root/myfile/lnmp1.4.tar.gz" ]] && [[ "$MD5" != "$(md5sum /root/myfile/lnmp1.4.tar.gz | awk '{ print $1 }')" ]]; then
        rm -rf /root/myfile/lnmp1.4.tar.gz
        echo_error "Error: lnmp1.4.tar.gz download failed"
fi

############################################################
#
#       8.结束语
#
############################################################
