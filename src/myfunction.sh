#!/bin/bash

############################################################
#
#       环境变量
#
############################################################
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


############################################################
#
#       全局变量
#
############################################################
FUNCTION_LIST=$(grep "^[a-z][a-z0-9_]*[a-z0-9]()$" $0 | sed "s/()$//g")
START_TIME=$(date "+%s")
LAST_OPTION=1
ARGUMENT_NUMBER=0


############################################################
#
#  黑:30  红:31  绿:32  黄:33  蓝:34  紫:35  天蓝:36  白:37
#  黑:40  红:41  绿:42  黄:43  蓝:44  紫:45  天蓝:46  白:47
#
############################################################


############################################################
#
#       显示高亮颜色且换行
#
############################################################
echo_color()
{
        # 局部变量
        local CONTENT="$1"
        local FONT="$2"
        local BACK="$3"
        
        [[ -z "$FONT" ]] && FONT="37"
        [[ -z "$BACK" ]] && BACK="40"
        
        echo -e "\e[1m\e[${BACK};${FONT}m${CONTENT}\e[0m"
}


############################################################
#
#       显示高亮颜色不换行
#
############################################################
echo_line()
{
        echo -n "$(echo_color "$1" "$2" "$3")"
}


############################################################
#
#       显示成功的提示
#
############################################################
echo_success()
{
        echo_line "Success: " "32"
        echo_color "$1"
}


############################################################
#
#       显示错误的提示
#
############################################################
echo_error()
{
        echo_line "Error: " "31"
        echo_color "$1"
}


############################################################
#
#       显示警告的提示
#
############################################################
echo_warning()
{
        echo_line "Warning: " "33"
        echo_color "$1"
}


############################################################
#
#       显示成功
#
############################################################
display_success()
{
        echo_color "Success" "32"
}


############################################################
#
#       显示错误
#
############################################################
display_error()
{
        echo_color "Error" "31"
}


############################################################
#
#       检测自定义函数的名称与选项是否为空
#
############################################################
check_function()
{
        if [[ -z "$1" ]]; then
                echo_error "${FUNCNAME}: missing operand"
                exit 1
        fi
        
        if ( ! echo "$1" | grep "^[a-z][a-z0-9_]*[a-z0-9]$" &> /dev/null ); then
                echo_error "$1: function not found"
                exit 1
        fi
        
        if [[ -z "$2" ]]; then
                echo_error "$1: missing operand"
                exit 1
        fi
}


############################################################
#
#       获取绝对路径
#
############################################################
absolute_path()
{
        check_function "$FUNCNAME" "$1"
        
        local MYPATH="$1"
        
        if ( echo "$MYPATH" | grep "^/" &> /dev/null ); then
                :
        elif ( echo "$MYPATH" | grep "^~" &> /dev/null ); then
                MYPATH="$(echo ~)$(echo "$MYPATH" | sed "s/^~//g")"
        else
                MYPATH="$(pwd)/${MYPATH}"
        fi
        
        echo "$MYPATH"
}


############################################################
#
#       获取路径中的文件
#
############################################################
path_file()
{
        check_function "$FUNCNAME" "$1"
        
        echo "$1" | awk -F/ '{ print $NF }'
}


############################################################
#
#       获取路径中的目录
#
############################################################
path_dir()
{
        check_function "$FUNCNAME" "$1"
        
        local FILE=$(echo "$1" | awk -F/ '{ print $NF }')
        
        echo "$1" | sed "s/${FILE}$//g"
}


############################################################
#
#       创建目录及文件
#
############################################################
mkdir_file()
{
        check_function "$FUNCNAME" "$1"
        
        local MYPATH=$(absolute_path "$1")
        
        if ( mkdir -p "$(path_dir "$MYPATH")" ); then
                touch "$MYPATH"
        else
                display_error
                exit 1
        fi
}


############################################################
#
#       检测指令是否存在，并给予执行权限
#
############################################################
check_command()
{
        check_function "$FUNCNAME" "$*"
        
        local COMMAND=
        
        for COMMAND in "$@"; do
                if [[ -n "$COMMAND" ]] && ( type -p "$COMMAND" &> /dev/null ); then
                        local COMMANDS=$(type -p "$COMMAND")
                else
                        echo_error "${COMMAND}: command not found"
                        exit 1
                fi
                
                if [[ ! -x "$COMMANDS" ]]; then
                        if [[ -L "$COMMANDS" ]]; then
                                chmod 755 "$(ls -l "$COMMANDS" | awk -F" -> " '{ print $NF }')"
                        else
                                chmod 755 "$COMMANDS"
                        fi
                fi
        done
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
        echo_success "$(time_used)"
}


############################################################
#
#       检测字符串是否为纯数字
#
############################################################
check_number()
{
        check_function "$FUNCNAME" "$1"
        
        if [[ -n "$(echo "$1" | sed "s/[0-9]//g")" ]]; then
                echo_error "$1: not a number"
                exit 1
        fi
}


############################################################
#
#       获取最后一个选项
#
############################################################
last_option()
{
        check_function "$FUNCNAME" "$*"
        
        check_number "$LAST_OPTION"
        
        local OPTION=
        local NUM=0
        
        for OPTION in "$@"; do
                (( NUM++ ))
                
                if [[ "$NUM" == "$(( $# + 1 - LAST_OPTION ))" ]]; then
                        echo "$OPTION"
                        break 1
                fi
        done
}


############################################################
#
#       获取倒数第二个选项
#
############################################################
last_option2()
{
        LAST_OPTION=2
        last_option "$@"
}


############################################################
#
#       获取倒数第三个选项
#
############################################################
last_option3()
{
        LAST_OPTION=3
        last_option "$@"
}


############################################################
#
#       获取倒数第四个选项
#
############################################################
last_option4()
{
        LAST_OPTION=4
        last_option "$@"
}


############################################################
#
#       获取倒数第五个选项
#
############################################################
last_option5()
{
        LAST_OPTION=5
        last_option "$@"
}


############################################################
#
#       获取倒数第六个选项
#
############################################################
last_option6()
{
        LAST_OPTION=6
        last_option "$@"
}


############################################################
#
#       获取倒数第七个选项
#
############################################################
last_option7()
{
        LAST_OPTION=7
        last_option "$@"
}


############################################################
#
#       获取倒数第八个选项
#
############################################################
last_option8()
{
        LAST_OPTION=8
        last_option "$@"
}


############################################################
#
#       获取倒数第九个选项
#
############################################################
last_option9()
{
        LAST_OPTION=9
        last_option "$@"
}


############################################################
#
#       显示指令的提示
#
############################################################
echo_command()
{
        check_function "$FUNCNAME" "$*"
        
        echo_line "Run command:" "32"
        
        local COMMAND=
        local NUM=0
        
        for COMMAND in "$@"; do
                check_command "$(echo "$COMMAND" | awk '{ print $1 }')"
                
                (( NUM++ ))
                if [[ "$NUM" == "$#" ]]; then
                        echo_color " $COMMAND" "35"
                else
                        echo_line " $COMMAND" "35"
                        echo_line " ," "32"
                fi
        done
}


############################################################
#
#       给字符串的每个字母添加前缀和后缀
#
############################################################
change_letter()
{
        check_function "$FUNCNAME" "$1"
        
        local STRING="$1"
        
        local LETTER=
        local LETTER_LIST="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z \
                           a b c d e f g h i j k l m n o p q r s t u v w x y z \
                           0 1 2 3 4 5 6 7 8 9"
        
        for LETTER in ${LETTER_LIST}; do
                STRING=$(echo "$STRING" | sed "s/${LETTER}/$3${LETTER}$2/g")
        done
        
        echo "$STRING"
}


############################################################
#
#       获取长选项
#
############################################################
long_options()
{
        check_function "$FUNCNAME" "$*"
        
        local OPTION=
        
        for OPTION in "$@"; do
                if ( echo "$OPTION" | grep "^--[A-Za-z0-9]" &> /dev/null ); then
                        echo "$OPTION" | awk -F= '{ print $1 }'
                fi
        done
}

long_option()
{
        check_function "$FUNCNAME" "$*"
        
        long_options "$@" | sort -u | xargs
}


############################################################
#
#       获取短选项
#
############################################################
short_options()
{
        check_function "$FUNCNAME" "$*"
        
        local OPTION=
        
        for OPTION in "$@"; do
                if ( echo "$OPTION" | grep "^-[A-Za-z0-9]" &> /dev/null ); then
                        echo "$OPTION" | sed "s/^-//g"
                fi
        done
}

short_option()
{
        check_function "$FUNCNAME" "$*"
        
        local OPTION=
        
        OPTION=$(short_options "$@" | xargs | sed "s/ //g")
        OPTION=$(change_letter "$OPTION" "\n" "-")
        OPTION=$(echo "$OPTION" | sort -u | xargs)
        
        echo "$OPTION"
}


############################################################
#
#       获取最后一个指令参数
#
############################################################
last_arguments()
{
        check_function "$FUNCNAME" "$*"
        
        local ARGUMENT=
        local ARGUMENT_LIST=$(last_option "$@")
        
        if ( echo "$ARGUMENT_LIST" | grep -v "^-" &> /dev/null ); then
                for ARGUMENT in ${ARGUMENT_LIST}; do
                        echo "${ARGUMENT}::last1"
                done
        fi
}

last_argument()
{
        check_function "$FUNCNAME" "$*"
        
        if [[ "$ARGUMENT_NUMBER" == "2" ]] || [[ "$ARGUMENT_NUMBER" == "1" ]]; then
                last_arguments "$@" | sort -u | xargs
        fi
}


############################################################
#
#       获取倒数第二个指令参数
#
############################################################
last_arguments2()
{
        check_function "$FUNCNAME" "$*"
        
        local ARGUMENT=
        local ARGUMENT_LIST=$(last_option2 "$@")
        
        if ( echo "$ARGUMENT_LIST" | grep -v "^-" &> /dev/null ) && [[ -n "$(last_argument "$@")" ]]; then
                for ARGUMENT in ${ARGUMENT_LIST}; do
                        echo "${ARGUMENT}::last2"
                done
        fi
}

last_argument2()
{
        check_function "$FUNCNAME" "$*"
        
        if [[ "$ARGUMENT_NUMBER" == "2" ]]; then
                last_arguments2 "$@" | sort -u | xargs
        fi
}


############################################################
#
#       获取长选项参数
#
############################################################
long_arguments()
{
        check_function "$FUNCNAME" "$*"
        
        local OPTION=
        local ARGUMENT=
        
        for OPTION in "$@"; do
                if ( echo "$OPTION" | grep "^--[A-Za-z0-9].*=" &> /dev/null ); then
                        local ARGUMENT_LIST=$(echo "$OPTION" | awk -F= '{ print $2 }')
                        OPTION=$(echo "$OPTION" | awk -F= '{ print $1 }')
                        
                        for ARGUMENT in ${ARGUMENT_LIST}; do
                                echo "${ARGUMENT}::${OPTION}"
                        done
                fi
        done
}

long_argument()
{
        check_function "$FUNCNAME" "$*"
        
        long_arguments "$@" | sort -u | xargs
}


############################################################
#
#       获取短选项参数
#
############################################################
short_arguments()
{
        check_function "$FUNCNAME" "$*"
        
        local OPTION=
        local NUM=0
        local TAG=0
        local ARGUMENT=
        local SHORT_OPTION=
        
        for OPTION in "$@"; do
                (( NUM++ ))
                
                if ( echo "$OPTION" | grep "^-[A-Za-z0-9]" &> /dev/null ); then
                        local SHORT_OPTION_LIST=$(short_option "$OPTION")
                        
                        if [[ "$ARGUMENT_NUMBER" == "2" ]]; then
                                [[ "$NUM" < "$(( $# - 2 ))" ]] && TAG=$(( NUM + 1 ))
                        elif [[ "$ARGUMENT_NUMBER" == "1" ]]; then
                                [[ "$NUM" < "$(( $# - 1 ))" ]] && TAG=$(( NUM + 1 ))
                        else
                                TAG=$(( NUM + 1 ))
                        fi
                fi
                
                if [[ "$NUM" == "$TAG" ]] && ( echo "$OPTION" | grep -v "^-" &> /dev/null ); then
                        for ARGUMENT in ${OPTION}; do
                                for SHORT_OPTION in ${SHORT_OPTION_LIST}; do
                                        echo "${ARGUMENT}::${SHORT_OPTION}"
                                done
                        done
                fi
        done
}

short_argument()
{
        check_function "$FUNCNAME" "$*"
        
        short_arguments "$@" | sort -u | xargs
}


############################################################
#
#       批量下载文件
#
############################################################
batch_download()
{
        check_function "$FUNCNAME" "$*"
        
        ARGUMENT_NUMBER=1
        
        local MAX=10
        local LONG_OPTION=
        local SHORT_ARGUMENT=
        local FILE_LIST=
        local FILE=
        local NUM=
        
        # 获取变量 URL、MD5、CHANGE、DOWNLOAD、DIRECTORY、FILE_LIST
        local URL=$(last_argument "$@" | awk -F"::" '{ print $1 }')
        local MD5=$(long_argument "$@" | awk -F"::" '{ print $1 }')
        
        for LONG_OPTION in $(long_option "$@"); do
                if ( echo "$LONG_OPTION" | grep "^--no$" &> /dev/null ); then
                        local CHANGE="--no"
                
                elif ( echo "$LONG_OPTION" | grep "^--wget$" &> /dev/null ); then
                        local DOWNLOAD="--wget"
                
                else
                        :
                fi
        done
        
        for SHORT_ARGUMENT in $(short_argument "$@"); do
                if ( echo "$SHORT_ARGUMENT" | grep "::-d$" &> /dev/null ); then
                        local DIRECTORY=$(echo "$SHORT_ARGUMENT" | awk -F"::" '{ print $1 }')
                
                elif ( echo "$SHORT_ARGUMENT" | grep "::-f$" &> /dev/null ); then
                        SHORT_ARGUMENT=$(echo "$SHORT_ARGUMENT" | awk -F"::" '{ print $1 }')
                        FILE_LIST="${FILE_LIST} ${SHORT_ARGUMENT}"
                
                else
                        :
                fi
        done
        
        # 处理变量 URL、DIRECTORY、FILE_LIST
        URL=$(echo "$URL" | sed "s/\/$//g")
        
        FILE_LIST=$(echo "$FILE_LIST" | sed "s/[ \t]\// /g")
        
        if ( echo "$URL" | grep -v "^http[s]*://" &> /dev/null ); then
                echo_error "${FUNCNAME}: missing URL"
                exit 1
        fi
        
        if [[ -z "$FILE_LIST" ]]; then
                FILE_LIST=$(echo "$URL" | awk -F/ '{ print $NF }')
                URL=$(echo "$URL" | sed "s/\/${FILE_LIST}$//g")
        fi
        
        if [[ -z "$DIRECTORY" ]]; then
                DIRECTORY=$(pwd)
        fi
        
        DIRECTORY=$(absolute_path "$DIRECTORY")
        
        #下载文件
        for FILE in ${FILE_LIST}; do
                local DIR_FILE="${DIRECTORY}/${FILE}"
                
                # 默认删除旧文件
                if [[ "$CHANGE" != "--no" ]]; then
                        [[ -f "$DIR_FILE" ]] && rm -rf "$DIR_FILE"
                fi
                
                for (( NUM=0; NUM < MAX; NUM++ )); do
                        if [[ -s "$DIR_FILE" ]]; then
                                # 如果 MD5 存在就检验 MD5，默认不检验
                                if [[ -n "$MD5" ]]; then
                                        if [[ "$MD5" == "$(md5sum "$DIR_FILE" | awk '{ print $1 }')" ]]; then
                                                break 1
                                        else
                                                rm -rf "$DIR_FILE"
                                        fi
                                else
                                        break 1
                                fi
                        else
                                # 创建目录
                                mkdir_file "$DIR_FILE"
                                
                                # 使用 wget 下载
                                if [[ "$DOWNLOAD" == "--wget" ]]; then
                                        yum -y install wget
                                        
                                        check_command "wget"
                                        
                                        local FILE_HEAD=$(path_dir "$FILE")
                                        
                                        wget -c -P "${DIRECTORY}/${FILE_HEAD}" "${URL}/${FILE}"
                                else
                                        # 默认使用 curl 下载
                                        curl -o "$DIR_FILE" "${URL}/${FILE}"
                                fi
                        fi
                done
                
                # 下载失败提示
                local FILE_TAIL=$(path_file "$FILE")
                
                if [[ "$NUM" == "$MAX" ]]; then
                        echo_error "${FILE_TAIL} download failed"
                        exit 1
                fi
                
                # 下载的文件不存在
                if [[ "$DOWNLOAD" != "--wget" ]]; then
                        if ( grep "<title>.*404.*</title>" "$DIR_FILE" &> /dev/null ); then
                                mv "$DIR_FILE" "${DIR_FILE}-404-$(date +"%Y%m%d%H%M%S")"
                                echo_warning "${FILE_TAIL} not found - 404"
                        fi
                fi
        done
}
