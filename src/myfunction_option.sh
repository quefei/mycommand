#!/bin/bash

############################################################
#
#       获取顺数第几个选项、编号
#
############################################################
front_option_number()
{
        local OPTION=
        local FRONT_NUMBER=
        local NUM="0"
        
        for OPTION in "$@"; do
                
                FRONT_NUMBER=$(( NUM++ ))
                
                if [[ "$OPTION" == "$1" ]]; then
                        continue 1
                fi
                
                if [[ "$FRONT_NUMBER" == "$1" ]]; then
                        echo "${OPTION}::${FRONT_NUMBER}"
                        break 1
                fi
                
        done
}


############################################################
#
#       获取倒数第几个选项、编号及顺数编号
#
############################################################
back_option_number()
{
        local OPTION=
        local FRONT_NUMBER=
        local BACK_NUMBER="$1"
        local NUM="0"
        
        for OPTION in "$@"; do
                
                FRONT_NUMBER=$(( NUM++ ))
                
                if [[ "$OPTION" == "$1" ]]; then
                        continue 1
                fi
                
                if [[ "$FRONT_NUMBER" == "$(( $#-$1 ))" ]]; then
                        echo "${OPTION}::${FRONT_NUMBER}::${BACK_NUMBER}"
                        break 1
                fi
                
        done
}


############################################################
#
#       获取顺数第几个选项
#
############################################################
front_option()
{
        front_option_number "$@" | awk -F:: '{ print $1 }'
}


############################################################
#
#       获取顺数第几个编号
#
############################################################
front_frontnum()
{
        front_option_number "$@" | awk -F:: '{ print $2 }'
}


############################################################
#
#       获取倒数第几个选项
#
############################################################
back_option()
{
        back_option_number "$@" | awk -F:: '{ print $1 }'
}


############################################################
#
#       获取倒数第几个选项对应的顺数编号
#
############################################################
back_frontnum()
{
        back_option_number "$@" | awk -F:: '{ print $2 }'
}


############################################################
#
#       获取倒数第几个编号
#
############################################################
back_backnum()
{
        back_option_number "$@" | awk -F:: '{ print $3 }'
}


############################################################
#
#       获取倒数第 1 ~ 9 个选项
#
############################################################
back_option1()
{
        back_option "1" "$@"
}

back_option2()
{
        back_option "2" "$@"
}

back_option3()
{
        back_option "3" "$@"
}

back_option4()
{
        back_option "4" "$@"
}

back_option5()
{
        back_option "5" "$@"
}

back_option6()
{
        back_option "6" "$@"
}

back_option7()
{
        back_option "7" "$@"
}

back_option8()
{
        back_option "8" "$@"
}

back_option9()
{
        back_option "9" "$@"
}


############################################################
#
#       给字符串的每个字母添加前缀和后缀
#
############################################################
letter_prefix_postfix()
{
        local LETTER=
        local LETTER_LIST="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z \
                           a b c d e f g h i j k l m n o p q r s t u v w x y z \
                           0 1 2 3 4 5 6 7 8 9"
        
        local PREFIX="$1"
        local STRING="$2"
        local POSTFIX="$3"
        
        for LETTER in ${LETTER_LIST}; do
                STRING=$(echo "$STRING" | sed "s/${LETTER}/${PREFIX}${LETTER}${POSTFIX}/g")
        done
        
        echo "$STRING"
}


############################################################
#
#       获取所有的短选项
#
############################################################
short_option()
{
        local OPTION=
        local LETTER=
        local STRING=
        
        for OPTION in "$@"; do
                if ( echo "$OPTION" | grep "^-[A-Za-z0-9]" &> /dev/null ); then
                        LETTER=$(echo "$OPTION" | sed "s/^-//g")
                        STRING="${STRING}${LETTER}"
                fi
        done
        
        STRING=$(letter_prefix_postfix "-" "$STRING" "\n")
        
        echo "$STRING" | sort -u
}


############################################################
#
#       获取某个短选项的参数
#
############################################################
short_argument()
{
        local NUM=
        local OPTION=
        
        for (( NUM=1; NUM < $#; NUM++ )); do
                OPTION=$(back_option "$NUM" "$@")
                
                if [[ "$OPTION" == "$1" ]]; then
                        back_option "$(( NUM-1 ))" "$@"
                        break 1
                fi
        done
}


############################################################
#
#       获取所有的长选项
#
############################################################
long_option()
{
        local OPTION=
        local LONG_OPTION=
        local LONG_OPTION_ALL=
        
        for OPTION in "$@"; do
                if ( echo "$OPTION" | grep "^--[A-Za-z0-9]" &> /dev/null ); then
                        LONG_OPTION=$(echo "$OPTION" | awk -F= '{ print $1 }')
                        LONG_OPTION_ALL="${LONG_OPTION_ALL}${LONG_OPTION}\n"
                fi
        done
        
        echo -e "$LONG_OPTION_ALL" | sed "/^$/d" | sort -u
}


############################################################
#
#       获取某个长选项的参数
#
############################################################
long_argument()
{
        local OPTION=
        
        for OPTION in "$@"; do
                if ( echo "$OPTION" | grep "^${1}=." &> /dev/null ); then
                        echo "$OPTION" | awk -F= '{ print $2 }'
                fi
        done
}
