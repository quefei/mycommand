#!/bin/bash

############################################################
#
#       
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
#       
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
#       
#
############################################################
back_option()
{
        back_option_number "$@" | awk -F:: '{ print $1 }'
}


############################################################
#
#       
#
############################################################
back_frontnum()
{
        back_option_number "$@" | awk -F:: '{ print $2 }'
}


############################################################
#
#       
#
############################################################
back_backnum()
{
        back_option_number "$@" | awk -F:: '{ print $3 }'
}


############################################################
#
#       
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
#       
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
#       
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















