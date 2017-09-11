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
front_option1()
{
        front_option_number "1" "$@" | awk -F:: '{ print $1 }'
}


############################################################
#
#       
#
############################################################
back_option1()
{
        back_option_number "1" "$@" | awk -F:: '{ print $1 }'
}


############################################################
#
#       
#
############################################################
back_frontnum1()
{
        back_option_number "1" "$@" | awk -F:: '{ print $2 }'
}


############################################################
#
#       
#
############################################################
back_backnum1()
{
        back_option_number "1" "$@" | awk -F:: '{ print $3 }'
}
