#!/bin/bash

############################################################
#
#  黑:30  红:31  绿:32  黄:33  蓝:34  紫:35  天蓝:36  白:37
#  黑:40  红:41  绿:42  黄:43  蓝:44  紫:45  天蓝:46  白:47
#
############################################################
START_TIME=$(date "+%s")
MYSQL_CONF="/root/.mysql.conf"
READ_FOR_VAR=


############################################################
#
#       显示高亮颜色不换行
#
############################################################
echo_line()
{
        echo -n "$(echo_color "$1" "$2")"
}


############################################################
#
#       显示成功的提示
#
############################################################
echo_success()
{
        echo_color "$1" "32"
}


############################################################
#
#       显示成功的提示不换行
#
############################################################
display_success()
{
        echo_line "Success: " "32"
        echo "$1"
}


############################################################
#
#       计时器
#
############################################################
time_used()
{
        local END_TIME=$(date "+%s")
        local MINUTES=$(( (END_TIME - START_TIME) / 60 ))
        local SECONDS=$(( (END_TIME - START_TIME) % 60 ))
        
        echo_color "${MINUTES} minutes ${SECONDS} seconds" "34"
}


############################################################
#
#       显示成功并计时
#
############################################################
time_success()
{
        display_success "$(time_used)"
}


############################################################
#
#       列出名称含有时间格式的文件
#
############################################################
# $(date +"%Y-%m-%d-%H%M%S")
ls_timefile()
{
        cd "$1"
        
        ls -F | grep "^${2}20[1-3][0-9]-[0-1][0-9]-[0-3][0-9]-[0-9]\{6\}${3}$" | sort -u
        
        cd - &> /dev/null
}


############################################################
#
#       列出名称含有时间格式的目录
#
############################################################
# $(date +"%Y-%m-%d-%H%M%S")
ls_timedir()
{
        cd "$1"
        
        ls -F | grep "^${2}20[1-3][0-9]-[0-1][0-9]-[0-3][0-9]-[0-9]\{6\}${3}/$" | sed "s/\/$//g" | sort -u
        
        cd - &> /dev/null
}


############################################################
#
#       调整系统时间
#
############################################################
adjust_time()
{
        local NUM=
        
        if ( ! type -p ntpdate &> /dev/null ) || ( ! type -p netstat &> /dev/null ); then
                for (( NUM=0; NUM < 5; NUM++ )); do
                        yum -y install ntpdate net-tools
                done
        fi
        
        if ( netstat -anutp | grep ntpd &> /dev/null ); then
                systemctl stop ntpd
                systemctl disable ntpd
        fi
        
        for (( NUM=1; NUM < 11; NUM++ )); do
                echo "adjust system time ${NUM} ..."
                local SECONDS=$(ntpdate ntp1.aliyun.com | awk '{ print $(NF-1) }')
                
                if [[ "0" < "$SECONDS" ]] && [[ "$SECONDS" < "1" ]]; then
                        break 1
                fi
        done
}


############################################################
#
#       read 颜色
#
############################################################
read_color()
{
        echo_line "$1" "$3"
        read "$2"
}


############################################################
#
#       read 循环
#
############################################################
# read_for "" "" "37" && echo $READ_FOR_VAR
read_for()
{
        local NUM=
        echo ""
        
        for (( NUM=0; NUM < 10; NUM++ )); do
                read_color "$1" "READ_FOR_VAR" "$3"
                echo ""
                
                if [[ -z "$READ_FOR_VAR" ]]; then
                        READ_FOR_VAR="$2"
                fi
                
                if [[ -n "$READ_FOR_VAR" ]]; then
                        break 1
                fi
        done
        
        if [[ "$NUM" == "10" ]]; then
                echo_error "Error: operation failed"
        fi
}


############################################################
#
#       获取路径中的文件
#
############################################################
path_file()
{
        echo "$1" | awk -F/ '{ print $NF }'
}


############################################################
#
#       获取路径中的目录
#
############################################################
path_dir()
{
        local FILE=$(echo "$1" | awk -F/ '{ print $NF }')
        echo "$1" | sed "s/${FILE}$//g"
}


############################################################
#
#       创建日志
#
############################################################
# command 2>> log
create_log()
{
        mkdir -p $(path_dir "$1")
        
        echo "" >> "$1"
        echo "" >> "$1"
        echo "$2: $(date +"%Y-%m-%d %H:%M:%S")" >> "$1"
        echo "----------------------------------------------------------------------------------------------------" >> "$1"
}


############################################################
#
#       检测指令是否存在
#
############################################################
check_command()
{
        local COMMAND=
        
        for COMMAND in "$@"; do
                if ( ! type -p ${COMMAND} &> /dev/null ) || [[ ! -x "$(type -p ${COMMAND})" ]]; then
                        echo_error "Error: ${COMMAND} not found"
                fi
        done
}


############################################################
#
#       获取静态 IP
#
############################################################
ip_addr()
{
        # 网关
        local GATEWAY=$(ip -o route | grep "^default" | awk '{ print $3 }')
        local GATEWAY_TAIL=$(echo "$GATEWAY" | awk -F. '{ print $4 }')
        
        # 网段
        local LAN=$(echo "$GATEWAY" | sed "s/\.${GATEWAY_TAIL}$//g")
        
        # IP
        local IPADDR=$(ip -o addr | grep "inet ${LAN}\.[0-9]" | awk '{ print $4 }' | awk -F/ '{ print $1 }')
        local IPADDR_TAIL=$(echo "$IPADDR" | awk -F. '{ print $4 }')
        
        # IP +1
        local IPADDR1="${LAN}.$((IPADDR_TAIL+1))"
        
        # IP -1
        local IPADDR_1="${LAN}.$((IPADDR_TAIL-1))"
        
          if [[ "$1" == "gw" ]]; then
                echo "$GATEWAY"
        elif [[ "$1" == "lan" ]]; then
                echo "$LAN"
        elif [[ "$1" == "ip" ]]; then
                echo "$IPADDR"
        elif [[ "$1" == "ip1" ]]; then
                echo "$IPADDR1"
        elif [[ "$1" == "ip_1" ]]; then
                echo "$IPADDR_1"
        else
                echo "$IPADDR"
        fi
}


############################################################
#
#       设置 MySQL 用户与密码
#
############################################################
mysql_password()
{
        read_for "mysql user (default: root): " "root" "37"
        local MYSQL_USER="$READ_FOR_VAR"
        read_for "mysql ${MYSQL_USER} password: " "" "37"
        local MYSQL_PASSWORD="$READ_FOR_VAR"
        
        echo "MYSQL_USER=${MYSQL_USER}" > "$MYSQL_CONF"
        echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}" >> "$MYSQL_CONF"
}


############################################################
#
#       检测 MySQL 用户与密码
#
############################################################
mysql_check()
{
        if [[ ! -s "$MYSQL_CONF" ]]; then
                echo "MYSQL_USER=" > "$MYSQL_CONF"
                echo "MYSQL_PASSWORD=" >> "$MYSQL_CONF"
                echo "MYSQL_DATABASE=" >> "$MYSQL_CONF"
        fi
        
        . "$MYSQL_CONF"
        
        if [[ -z "$MYSQL_USER" ]]; then
                echo_error "Error: Setting the user in ${MYSQL_CONF}"
        fi
        
        if [[ -z "$MYSQL_PASSWORD" ]]; then
                echo_error "Error: Setting the password in ${MYSQL_CONF}"
        fi
        
        if [[ -z "$MYSQL_DATABASE" ]]; then
                echo_error "Error: Setting the database in ${MYSQL_CONF}"
        fi
}


############################################################
#
#       创建 .my.cnf
#
############################################################
mysql_create()
{
        mysql_check
        
cat > /root/.my.cnf <<-EOF
[client]
user=${MYSQL_USER}
password=${MYSQL_PASSWORD}
EOF
}


############################################################
#
#       删除 .my.cnf
#
############################################################
mysql_remove()
{
        if [[ -f "/root/.my.cnf" ]]; then
                rm -rf /root/.my.cnf
        fi
}


############################################################
#
#       创建 screen 并发送指令
#
############################################################
# screen_command "NAME" "COMMAND"
screen_command()
{
        screen -dmS "$1"
        screen -x -S "$1" -p 0 -X stuff "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/bin"
        screen -x -S "$1" -p 0 -X stuff $'\n'
        screen -x -S "$1" -p 0 -X stuff "$2"
        screen -x -S "$1" -p 0 -X stuff $'\n'
        sleep 3
        screen -r "$1"
}


############################################################
#
#       倒计时
#
############################################################
countdown()
{
        local NUM=
        
        for (( NUM="$1"; NUM >= 0; NUM-- )); do
                if [[ "$NUM" > "0" ]]; then
                        echo_line " ${2}${NUM} seconds                     \r" "34"
                else
                        echo_line "                                        \r" "34"
                fi
                
                sleep 1
        done
}
