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

front_option2()
{
        front_option_number "2" "$@" | awk -F:: '{ print $1 }'
}

front_option3()
{
        front_option_number "3" "$@" | awk -F:: '{ print $1 }'
}

front_option4()
{
        front_option_number "4" "$@" | awk -F:: '{ print $1 }'
}

front_option5()
{
        front_option_number "5" "$@" | awk -F:: '{ print $1 }'
}

front_option6()
{
        front_option_number "6" "$@" | awk -F:: '{ print $1 }'
}

front_option7()
{
        front_option_number "7" "$@" | awk -F:: '{ print $1 }'
}

front_option8()
{
        front_option_number "8" "$@" | awk -F:: '{ print $1 }'
}

front_option9()
{
        front_option_number "9" "$@" | awk -F:: '{ print $1 }'
}

front_option10()
{
        front_option_number "10" "$@" | awk -F:: '{ print $1 }'
}

front_option11()
{
        front_option_number "11" "$@" | awk -F:: '{ print $1 }'
}

front_option12()
{
        front_option_number "12" "$@" | awk -F:: '{ print $1 }'
}

front_option13()
{
        front_option_number "13" "$@" | awk -F:: '{ print $1 }'
}

front_option14()
{
        front_option_number "14" "$@" | awk -F:: '{ print $1 }'
}

front_option15()
{
        front_option_number "15" "$@" | awk -F:: '{ print $1 }'
}

front_option16()
{
        front_option_number "16" "$@" | awk -F:: '{ print $1 }'
}

front_option17()
{
        front_option_number "17" "$@" | awk -F:: '{ print $1 }'
}

front_option18()
{
        front_option_number "18" "$@" | awk -F:: '{ print $1 }'
}

front_option19()
{
        front_option_number "19" "$@" | awk -F:: '{ print $1 }'
}

front_option20()
{
        front_option_number "20" "$@" | awk -F:: '{ print $1 }'
}

front_option21()
{
        front_option_number "21" "$@" | awk -F:: '{ print $1 }'
}

front_option22()
{
        front_option_number "22" "$@" | awk -F:: '{ print $1 }'
}

front_option23()
{
        front_option_number "23" "$@" | awk -F:: '{ print $1 }'
}

front_option24()
{
        front_option_number "24" "$@" | awk -F:: '{ print $1 }'
}

front_option25()
{
        front_option_number "25" "$@" | awk -F:: '{ print $1 }'
}

front_option26()
{
        front_option_number "26" "$@" | awk -F:: '{ print $1 }'
}

front_option27()
{
        front_option_number "27" "$@" | awk -F:: '{ print $1 }'
}

front_option28()
{
        front_option_number "28" "$@" | awk -F:: '{ print $1 }'
}

front_option29()
{
        front_option_number "29" "$@" | awk -F:: '{ print $1 }'
}

front_option30()
{
        front_option_number "30" "$@" | awk -F:: '{ print $1 }'
}

front_option31()
{
        front_option_number "31" "$@" | awk -F:: '{ print $1 }'
}

front_option32()
{
        front_option_number "32" "$@" | awk -F:: '{ print $1 }'
}

front_option33()
{
        front_option_number "33" "$@" | awk -F:: '{ print $1 }'
}

front_option34()
{
        front_option_number "34" "$@" | awk -F:: '{ print $1 }'
}

front_option35()
{
        front_option_number "35" "$@" | awk -F:: '{ print $1 }'
}

front_option36()
{
        front_option_number "36" "$@" | awk -F:: '{ print $1 }'
}

front_option37()
{
        front_option_number "37" "$@" | awk -F:: '{ print $1 }'
}

front_option38()
{
        front_option_number "38" "$@" | awk -F:: '{ print $1 }'
}

front_option39()
{
        front_option_number "39" "$@" | awk -F:: '{ print $1 }'
}

front_option40()
{
        front_option_number "40" "$@" | awk -F:: '{ print $1 }'
}

front_option41()
{
        front_option_number "41" "$@" | awk -F:: '{ print $1 }'
}

front_option42()
{
        front_option_number "42" "$@" | awk -F:: '{ print $1 }'
}

front_option43()
{
        front_option_number "43" "$@" | awk -F:: '{ print $1 }'
}

front_option44()
{
        front_option_number "44" "$@" | awk -F:: '{ print $1 }'
}

front_option45()
{
        front_option_number "45" "$@" | awk -F:: '{ print $1 }'
}

front_option46()
{
        front_option_number "46" "$@" | awk -F:: '{ print $1 }'
}

front_option47()
{
        front_option_number "47" "$@" | awk -F:: '{ print $1 }'
}

front_option48()
{
        front_option_number "48" "$@" | awk -F:: '{ print $1 }'
}

front_option49()
{
        front_option_number "49" "$@" | awk -F:: '{ print $1 }'
}

front_option50()
{
        front_option_number "50" "$@" | awk -F:: '{ print $1 }'
}

front_option51()
{
        front_option_number "51" "$@" | awk -F:: '{ print $1 }'
}

front_option52()
{
        front_option_number "52" "$@" | awk -F:: '{ print $1 }'
}

front_option53()
{
        front_option_number "53" "$@" | awk -F:: '{ print $1 }'
}

front_option54()
{
        front_option_number "54" "$@" | awk -F:: '{ print $1 }'
}

front_option55()
{
        front_option_number "55" "$@" | awk -F:: '{ print $1 }'
}

front_option56()
{
        front_option_number "56" "$@" | awk -F:: '{ print $1 }'
}

front_option57()
{
        front_option_number "57" "$@" | awk -F:: '{ print $1 }'
}

front_option58()
{
        front_option_number "58" "$@" | awk -F:: '{ print $1 }'
}

front_option59()
{
        front_option_number "59" "$@" | awk -F:: '{ print $1 }'
}

front_option60()
{
        front_option_number "60" "$@" | awk -F:: '{ print $1 }'
}

front_option61()
{
        front_option_number "61" "$@" | awk -F:: '{ print $1 }'
}

front_option62()
{
        front_option_number "62" "$@" | awk -F:: '{ print $1 }'
}

front_option63()
{
        front_option_number "63" "$@" | awk -F:: '{ print $1 }'
}

front_option64()
{
        front_option_number "64" "$@" | awk -F:: '{ print $1 }'
}

front_option65()
{
        front_option_number "65" "$@" | awk -F:: '{ print $1 }'
}

front_option66()
{
        front_option_number "66" "$@" | awk -F:: '{ print $1 }'
}

front_option67()
{
        front_option_number "67" "$@" | awk -F:: '{ print $1 }'
}

front_option68()
{
        front_option_number "68" "$@" | awk -F:: '{ print $1 }'
}

front_option69()
{
        front_option_number "69" "$@" | awk -F:: '{ print $1 }'
}

front_option70()
{
        front_option_number "70" "$@" | awk -F:: '{ print $1 }'
}

front_option71()
{
        front_option_number "71" "$@" | awk -F:: '{ print $1 }'
}

front_option72()
{
        front_option_number "72" "$@" | awk -F:: '{ print $1 }'
}

front_option73()
{
        front_option_number "73" "$@" | awk -F:: '{ print $1 }'
}

front_option74()
{
        front_option_number "74" "$@" | awk -F:: '{ print $1 }'
}

front_option75()
{
        front_option_number "75" "$@" | awk -F:: '{ print $1 }'
}

front_option76()
{
        front_option_number "76" "$@" | awk -F:: '{ print $1 }'
}

front_option77()
{
        front_option_number "77" "$@" | awk -F:: '{ print $1 }'
}

front_option78()
{
        front_option_number "78" "$@" | awk -F:: '{ print $1 }'
}

front_option79()
{
        front_option_number "79" "$@" | awk -F:: '{ print $1 }'
}

front_option80()
{
        front_option_number "80" "$@" | awk -F:: '{ print $1 }'
}

front_option81()
{
        front_option_number "81" "$@" | awk -F:: '{ print $1 }'
}

front_option82()
{
        front_option_number "82" "$@" | awk -F:: '{ print $1 }'
}

front_option83()
{
        front_option_number "83" "$@" | awk -F:: '{ print $1 }'
}

front_option84()
{
        front_option_number "84" "$@" | awk -F:: '{ print $1 }'
}

front_option85()
{
        front_option_number "85" "$@" | awk -F:: '{ print $1 }'
}

front_option86()
{
        front_option_number "86" "$@" | awk -F:: '{ print $1 }'
}

front_option87()
{
        front_option_number "87" "$@" | awk -F:: '{ print $1 }'
}

front_option88()
{
        front_option_number "88" "$@" | awk -F:: '{ print $1 }'
}

front_option89()
{
        front_option_number "89" "$@" | awk -F:: '{ print $1 }'
}

front_option90()
{
        front_option_number "90" "$@" | awk -F:: '{ print $1 }'
}

front_option91()
{
        front_option_number "91" "$@" | awk -F:: '{ print $1 }'
}

front_option92()
{
        front_option_number "92" "$@" | awk -F:: '{ print $1 }'
}

front_option93()
{
        front_option_number "93" "$@" | awk -F:: '{ print $1 }'
}

front_option94()
{
        front_option_number "94" "$@" | awk -F:: '{ print $1 }'
}

front_option95()
{
        front_option_number "95" "$@" | awk -F:: '{ print $1 }'
}

front_option96()
{
        front_option_number "96" "$@" | awk -F:: '{ print $1 }'
}

front_option97()
{
        front_option_number "97" "$@" | awk -F:: '{ print $1 }'
}

front_option98()
{
        front_option_number "98" "$@" | awk -F:: '{ print $1 }'
}

front_option99()
{
        front_option_number "99" "$@" | awk -F:: '{ print $1 }'
}

front_option100()
{
        front_option_number "100" "$@" | awk -F:: '{ print $1 }'
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

back_option2()
{
        back_option_number "2" "$@" | awk -F:: '{ print $1 }'
}

back_option3()
{
        back_option_number "3" "$@" | awk -F:: '{ print $1 }'
}

back_option4()
{
        back_option_number "4" "$@" | awk -F:: '{ print $1 }'
}

back_option5()
{
        back_option_number "5" "$@" | awk -F:: '{ print $1 }'
}

back_option6()
{
        back_option_number "6" "$@" | awk -F:: '{ print $1 }'
}

back_option7()
{
        back_option_number "7" "$@" | awk -F:: '{ print $1 }'
}

back_option8()
{
        back_option_number "8" "$@" | awk -F:: '{ print $1 }'
}

back_option9()
{
        back_option_number "9" "$@" | awk -F:: '{ print $1 }'
}

back_option10()
{
        back_option_number "10" "$@" | awk -F:: '{ print $1 }'
}

back_option11()
{
        back_option_number "11" "$@" | awk -F:: '{ print $1 }'
}

back_option12()
{
        back_option_number "12" "$@" | awk -F:: '{ print $1 }'
}

back_option13()
{
        back_option_number "13" "$@" | awk -F:: '{ print $1 }'
}

back_option14()
{
        back_option_number "14" "$@" | awk -F:: '{ print $1 }'
}

back_option15()
{
        back_option_number "15" "$@" | awk -F:: '{ print $1 }'
}

back_option16()
{
        back_option_number "16" "$@" | awk -F:: '{ print $1 }'
}

back_option17()
{
        back_option_number "17" "$@" | awk -F:: '{ print $1 }'
}

back_option18()
{
        back_option_number "18" "$@" | awk -F:: '{ print $1 }'
}

back_option19()
{
        back_option_number "19" "$@" | awk -F:: '{ print $1 }'
}

back_option20()
{
        back_option_number "20" "$@" | awk -F:: '{ print $1 }'
}

back_option21()
{
        back_option_number "21" "$@" | awk -F:: '{ print $1 }'
}

back_option22()
{
        back_option_number "22" "$@" | awk -F:: '{ print $1 }'
}

back_option23()
{
        back_option_number "23" "$@" | awk -F:: '{ print $1 }'
}

back_option24()
{
        back_option_number "24" "$@" | awk -F:: '{ print $1 }'
}

back_option25()
{
        back_option_number "25" "$@" | awk -F:: '{ print $1 }'
}

back_option26()
{
        back_option_number "26" "$@" | awk -F:: '{ print $1 }'
}

back_option27()
{
        back_option_number "27" "$@" | awk -F:: '{ print $1 }'
}

back_option28()
{
        back_option_number "28" "$@" | awk -F:: '{ print $1 }'
}

back_option29()
{
        back_option_number "29" "$@" | awk -F:: '{ print $1 }'
}

back_option30()
{
        back_option_number "30" "$@" | awk -F:: '{ print $1 }'
}

back_option31()
{
        back_option_number "31" "$@" | awk -F:: '{ print $1 }'
}

back_option32()
{
        back_option_number "32" "$@" | awk -F:: '{ print $1 }'
}

back_option33()
{
        back_option_number "33" "$@" | awk -F:: '{ print $1 }'
}

back_option34()
{
        back_option_number "34" "$@" | awk -F:: '{ print $1 }'
}

back_option35()
{
        back_option_number "35" "$@" | awk -F:: '{ print $1 }'
}

back_option36()
{
        back_option_number "36" "$@" | awk -F:: '{ print $1 }'
}

back_option37()
{
        back_option_number "37" "$@" | awk -F:: '{ print $1 }'
}

back_option38()
{
        back_option_number "38" "$@" | awk -F:: '{ print $1 }'
}

back_option39()
{
        back_option_number "39" "$@" | awk -F:: '{ print $1 }'
}

back_option40()
{
        back_option_number "40" "$@" | awk -F:: '{ print $1 }'
}

back_option41()
{
        back_option_number "41" "$@" | awk -F:: '{ print $1 }'
}

back_option42()
{
        back_option_number "42" "$@" | awk -F:: '{ print $1 }'
}

back_option43()
{
        back_option_number "43" "$@" | awk -F:: '{ print $1 }'
}

back_option44()
{
        back_option_number "44" "$@" | awk -F:: '{ print $1 }'
}

back_option45()
{
        back_option_number "45" "$@" | awk -F:: '{ print $1 }'
}

back_option46()
{
        back_option_number "46" "$@" | awk -F:: '{ print $1 }'
}

back_option47()
{
        back_option_number "47" "$@" | awk -F:: '{ print $1 }'
}

back_option48()
{
        back_option_number "48" "$@" | awk -F:: '{ print $1 }'
}

back_option49()
{
        back_option_number "49" "$@" | awk -F:: '{ print $1 }'
}

back_option50()
{
        back_option_number "50" "$@" | awk -F:: '{ print $1 }'
}

back_option51()
{
        back_option_number "51" "$@" | awk -F:: '{ print $1 }'
}

back_option52()
{
        back_option_number "52" "$@" | awk -F:: '{ print $1 }'
}

back_option53()
{
        back_option_number "53" "$@" | awk -F:: '{ print $1 }'
}

back_option54()
{
        back_option_number "54" "$@" | awk -F:: '{ print $1 }'
}

back_option55()
{
        back_option_number "55" "$@" | awk -F:: '{ print $1 }'
}

back_option56()
{
        back_option_number "56" "$@" | awk -F:: '{ print $1 }'
}

back_option57()
{
        back_option_number "57" "$@" | awk -F:: '{ print $1 }'
}

back_option58()
{
        back_option_number "58" "$@" | awk -F:: '{ print $1 }'
}

back_option59()
{
        back_option_number "59" "$@" | awk -F:: '{ print $1 }'
}

back_option60()
{
        back_option_number "60" "$@" | awk -F:: '{ print $1 }'
}

back_option61()
{
        back_option_number "61" "$@" | awk -F:: '{ print $1 }'
}

back_option62()
{
        back_option_number "62" "$@" | awk -F:: '{ print $1 }'
}

back_option63()
{
        back_option_number "63" "$@" | awk -F:: '{ print $1 }'
}

back_option64()
{
        back_option_number "64" "$@" | awk -F:: '{ print $1 }'
}

back_option65()
{
        back_option_number "65" "$@" | awk -F:: '{ print $1 }'
}

back_option66()
{
        back_option_number "66" "$@" | awk -F:: '{ print $1 }'
}

back_option67()
{
        back_option_number "67" "$@" | awk -F:: '{ print $1 }'
}

back_option68()
{
        back_option_number "68" "$@" | awk -F:: '{ print $1 }'
}

back_option69()
{
        back_option_number "69" "$@" | awk -F:: '{ print $1 }'
}

back_option70()
{
        back_option_number "70" "$@" | awk -F:: '{ print $1 }'
}

back_option71()
{
        back_option_number "71" "$@" | awk -F:: '{ print $1 }'
}

back_option72()
{
        back_option_number "72" "$@" | awk -F:: '{ print $1 }'
}

back_option73()
{
        back_option_number "73" "$@" | awk -F:: '{ print $1 }'
}

back_option74()
{
        back_option_number "74" "$@" | awk -F:: '{ print $1 }'
}

back_option75()
{
        back_option_number "75" "$@" | awk -F:: '{ print $1 }'
}

back_option76()
{
        back_option_number "76" "$@" | awk -F:: '{ print $1 }'
}

back_option77()
{
        back_option_number "77" "$@" | awk -F:: '{ print $1 }'
}

back_option78()
{
        back_option_number "78" "$@" | awk -F:: '{ print $1 }'
}

back_option79()
{
        back_option_number "79" "$@" | awk -F:: '{ print $1 }'
}

back_option80()
{
        back_option_number "80" "$@" | awk -F:: '{ print $1 }'
}

back_option81()
{
        back_option_number "81" "$@" | awk -F:: '{ print $1 }'
}

back_option82()
{
        back_option_number "82" "$@" | awk -F:: '{ print $1 }'
}

back_option83()
{
        back_option_number "83" "$@" | awk -F:: '{ print $1 }'
}

back_option84()
{
        back_option_number "84" "$@" | awk -F:: '{ print $1 }'
}

back_option85()
{
        back_option_number "85" "$@" | awk -F:: '{ print $1 }'
}

back_option86()
{
        back_option_number "86" "$@" | awk -F:: '{ print $1 }'
}

back_option87()
{
        back_option_number "87" "$@" | awk -F:: '{ print $1 }'
}

back_option88()
{
        back_option_number "88" "$@" | awk -F:: '{ print $1 }'
}

back_option89()
{
        back_option_number "89" "$@" | awk -F:: '{ print $1 }'
}

back_option90()
{
        back_option_number "90" "$@" | awk -F:: '{ print $1 }'
}

back_option91()
{
        back_option_number "91" "$@" | awk -F:: '{ print $1 }'
}

back_option92()
{
        back_option_number "92" "$@" | awk -F:: '{ print $1 }'
}

back_option93()
{
        back_option_number "93" "$@" | awk -F:: '{ print $1 }'
}

back_option94()
{
        back_option_number "94" "$@" | awk -F:: '{ print $1 }'
}

back_option95()
{
        back_option_number "95" "$@" | awk -F:: '{ print $1 }'
}

back_option96()
{
        back_option_number "96" "$@" | awk -F:: '{ print $1 }'
}

back_option97()
{
        back_option_number "97" "$@" | awk -F:: '{ print $1 }'
}

back_option98()
{
        back_option_number "98" "$@" | awk -F:: '{ print $1 }'
}

back_option99()
{
        back_option_number "99" "$@" | awk -F:: '{ print $1 }'
}

back_option100()
{
        back_option_number "100" "$@" | awk -F:: '{ print $1 }'
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

back_frontnum2()
{
        back_option_number "2" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum3()
{
        back_option_number "3" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum4()
{
        back_option_number "4" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum5()
{
        back_option_number "5" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum6()
{
        back_option_number "6" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum7()
{
        back_option_number "7" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum8()
{
        back_option_number "8" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum9()
{
        back_option_number "9" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum10()
{
        back_option_number "10" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum11()
{
        back_option_number "11" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum12()
{
        back_option_number "12" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum13()
{
        back_option_number "13" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum14()
{
        back_option_number "14" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum15()
{
        back_option_number "15" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum16()
{
        back_option_number "16" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum17()
{
        back_option_number "17" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum18()
{
        back_option_number "18" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum19()
{
        back_option_number "19" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum20()
{
        back_option_number "20" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum21()
{
        back_option_number "21" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum22()
{
        back_option_number "22" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum23()
{
        back_option_number "23" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum24()
{
        back_option_number "24" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum25()
{
        back_option_number "25" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum26()
{
        back_option_number "26" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum27()
{
        back_option_number "27" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum28()
{
        back_option_number "28" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum29()
{
        back_option_number "29" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum30()
{
        back_option_number "30" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum31()
{
        back_option_number "31" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum32()
{
        back_option_number "32" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum33()
{
        back_option_number "33" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum34()
{
        back_option_number "34" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum35()
{
        back_option_number "35" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum36()
{
        back_option_number "36" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum37()
{
        back_option_number "37" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum38()
{
        back_option_number "38" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum39()
{
        back_option_number "39" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum40()
{
        back_option_number "40" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum41()
{
        back_option_number "41" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum42()
{
        back_option_number "42" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum43()
{
        back_option_number "43" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum44()
{
        back_option_number "44" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum45()
{
        back_option_number "45" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum46()
{
        back_option_number "46" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum47()
{
        back_option_number "47" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum48()
{
        back_option_number "48" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum49()
{
        back_option_number "49" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum50()
{
        back_option_number "50" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum51()
{
        back_option_number "51" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum52()
{
        back_option_number "52" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum53()
{
        back_option_number "53" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum54()
{
        back_option_number "54" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum55()
{
        back_option_number "55" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum56()
{
        back_option_number "56" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum57()
{
        back_option_number "57" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum58()
{
        back_option_number "58" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum59()
{
        back_option_number "59" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum60()
{
        back_option_number "60" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum61()
{
        back_option_number "61" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum62()
{
        back_option_number "62" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum63()
{
        back_option_number "63" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum64()
{
        back_option_number "64" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum65()
{
        back_option_number "65" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum66()
{
        back_option_number "66" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum67()
{
        back_option_number "67" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum68()
{
        back_option_number "68" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum69()
{
        back_option_number "69" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum70()
{
        back_option_number "70" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum71()
{
        back_option_number "71" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum72()
{
        back_option_number "72" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum73()
{
        back_option_number "73" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum74()
{
        back_option_number "74" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum75()
{
        back_option_number "75" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum76()
{
        back_option_number "76" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum77()
{
        back_option_number "77" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum78()
{
        back_option_number "78" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum79()
{
        back_option_number "79" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum80()
{
        back_option_number "80" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum81()
{
        back_option_number "81" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum82()
{
        back_option_number "82" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum83()
{
        back_option_number "83" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum84()
{
        back_option_number "84" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum85()
{
        back_option_number "85" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum86()
{
        back_option_number "86" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum87()
{
        back_option_number "87" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum88()
{
        back_option_number "88" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum89()
{
        back_option_number "89" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum90()
{
        back_option_number "90" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum91()
{
        back_option_number "91" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum92()
{
        back_option_number "92" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum93()
{
        back_option_number "93" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum94()
{
        back_option_number "94" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum95()
{
        back_option_number "95" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum96()
{
        back_option_number "96" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum97()
{
        back_option_number "97" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum98()
{
        back_option_number "98" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum99()
{
        back_option_number "99" "$@" | awk -F:: '{ print $2 }'
}

back_frontnum100()
{
        back_option_number "100" "$@" | awk -F:: '{ print $2 }'
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

back_backnum2()
{
        back_option_number "2" "$@" | awk -F:: '{ print $3 }'
}

back_backnum3()
{
        back_option_number "3" "$@" | awk -F:: '{ print $3 }'
}

back_backnum4()
{
        back_option_number "4" "$@" | awk -F:: '{ print $3 }'
}

back_backnum5()
{
        back_option_number "5" "$@" | awk -F:: '{ print $3 }'
}

back_backnum6()
{
        back_option_number "6" "$@" | awk -F:: '{ print $3 }'
}

back_backnum7()
{
        back_option_number "7" "$@" | awk -F:: '{ print $3 }'
}

back_backnum8()
{
        back_option_number "8" "$@" | awk -F:: '{ print $3 }'
}

back_backnum9()
{
        back_option_number "9" "$@" | awk -F:: '{ print $3 }'
}

back_backnum10()
{
        back_option_number "10" "$@" | awk -F:: '{ print $3 }'
}

back_backnum11()
{
        back_option_number "11" "$@" | awk -F:: '{ print $3 }'
}

back_backnum12()
{
        back_option_number "12" "$@" | awk -F:: '{ print $3 }'
}

back_backnum13()
{
        back_option_number "13" "$@" | awk -F:: '{ print $3 }'
}

back_backnum14()
{
        back_option_number "14" "$@" | awk -F:: '{ print $3 }'
}

back_backnum15()
{
        back_option_number "15" "$@" | awk -F:: '{ print $3 }'
}

back_backnum16()
{
        back_option_number "16" "$@" | awk -F:: '{ print $3 }'
}

back_backnum17()
{
        back_option_number "17" "$@" | awk -F:: '{ print $3 }'
}

back_backnum18()
{
        back_option_number "18" "$@" | awk -F:: '{ print $3 }'
}

back_backnum19()
{
        back_option_number "19" "$@" | awk -F:: '{ print $3 }'
}

back_backnum20()
{
        back_option_number "20" "$@" | awk -F:: '{ print $3 }'
}

back_backnum21()
{
        back_option_number "21" "$@" | awk -F:: '{ print $3 }'
}

back_backnum22()
{
        back_option_number "22" "$@" | awk -F:: '{ print $3 }'
}

back_backnum23()
{
        back_option_number "23" "$@" | awk -F:: '{ print $3 }'
}

back_backnum24()
{
        back_option_number "24" "$@" | awk -F:: '{ print $3 }'
}

back_backnum25()
{
        back_option_number "25" "$@" | awk -F:: '{ print $3 }'
}

back_backnum26()
{
        back_option_number "26" "$@" | awk -F:: '{ print $3 }'
}

back_backnum27()
{
        back_option_number "27" "$@" | awk -F:: '{ print $3 }'
}

back_backnum28()
{
        back_option_number "28" "$@" | awk -F:: '{ print $3 }'
}

back_backnum29()
{
        back_option_number "29" "$@" | awk -F:: '{ print $3 }'
}

back_backnum30()
{
        back_option_number "30" "$@" | awk -F:: '{ print $3 }'
}

back_backnum31()
{
        back_option_number "31" "$@" | awk -F:: '{ print $3 }'
}

back_backnum32()
{
        back_option_number "32" "$@" | awk -F:: '{ print $3 }'
}

back_backnum33()
{
        back_option_number "33" "$@" | awk -F:: '{ print $3 }'
}

back_backnum34()
{
        back_option_number "34" "$@" | awk -F:: '{ print $3 }'
}

back_backnum35()
{
        back_option_number "35" "$@" | awk -F:: '{ print $3 }'
}

back_backnum36()
{
        back_option_number "36" "$@" | awk -F:: '{ print $3 }'
}

back_backnum37()
{
        back_option_number "37" "$@" | awk -F:: '{ print $3 }'
}

back_backnum38()
{
        back_option_number "38" "$@" | awk -F:: '{ print $3 }'
}

back_backnum39()
{
        back_option_number "39" "$@" | awk -F:: '{ print $3 }'
}

back_backnum40()
{
        back_option_number "40" "$@" | awk -F:: '{ print $3 }'
}

back_backnum41()
{
        back_option_number "41" "$@" | awk -F:: '{ print $3 }'
}

back_backnum42()
{
        back_option_number "42" "$@" | awk -F:: '{ print $3 }'
}

back_backnum43()
{
        back_option_number "43" "$@" | awk -F:: '{ print $3 }'
}

back_backnum44()
{
        back_option_number "44" "$@" | awk -F:: '{ print $3 }'
}

back_backnum45()
{
        back_option_number "45" "$@" | awk -F:: '{ print $3 }'
}

back_backnum46()
{
        back_option_number "46" "$@" | awk -F:: '{ print $3 }'
}

back_backnum47()
{
        back_option_number "47" "$@" | awk -F:: '{ print $3 }'
}

back_backnum48()
{
        back_option_number "48" "$@" | awk -F:: '{ print $3 }'
}

back_backnum49()
{
        back_option_number "49" "$@" | awk -F:: '{ print $3 }'
}

back_backnum50()
{
        back_option_number "50" "$@" | awk -F:: '{ print $3 }'
}

back_backnum51()
{
        back_option_number "51" "$@" | awk -F:: '{ print $3 }'
}

back_backnum52()
{
        back_option_number "52" "$@" | awk -F:: '{ print $3 }'
}

back_backnum53()
{
        back_option_number "53" "$@" | awk -F:: '{ print $3 }'
}

back_backnum54()
{
        back_option_number "54" "$@" | awk -F:: '{ print $3 }'
}

back_backnum55()
{
        back_option_number "55" "$@" | awk -F:: '{ print $3 }'
}

back_backnum56()
{
        back_option_number "56" "$@" | awk -F:: '{ print $3 }'
}

back_backnum57()
{
        back_option_number "57" "$@" | awk -F:: '{ print $3 }'
}

back_backnum58()
{
        back_option_number "58" "$@" | awk -F:: '{ print $3 }'
}

back_backnum59()
{
        back_option_number "59" "$@" | awk -F:: '{ print $3 }'
}

back_backnum60()
{
        back_option_number "60" "$@" | awk -F:: '{ print $3 }'
}

back_backnum61()
{
        back_option_number "61" "$@" | awk -F:: '{ print $3 }'
}

back_backnum62()
{
        back_option_number "62" "$@" | awk -F:: '{ print $3 }'
}

back_backnum63()
{
        back_option_number "63" "$@" | awk -F:: '{ print $3 }'
}

back_backnum64()
{
        back_option_number "64" "$@" | awk -F:: '{ print $3 }'
}

back_backnum65()
{
        back_option_number "65" "$@" | awk -F:: '{ print $3 }'
}

back_backnum66()
{
        back_option_number "66" "$@" | awk -F:: '{ print $3 }'
}

back_backnum67()
{
        back_option_number "67" "$@" | awk -F:: '{ print $3 }'
}

back_backnum68()
{
        back_option_number "68" "$@" | awk -F:: '{ print $3 }'
}

back_backnum69()
{
        back_option_number "69" "$@" | awk -F:: '{ print $3 }'
}

back_backnum70()
{
        back_option_number "70" "$@" | awk -F:: '{ print $3 }'
}

back_backnum71()
{
        back_option_number "71" "$@" | awk -F:: '{ print $3 }'
}

back_backnum72()
{
        back_option_number "72" "$@" | awk -F:: '{ print $3 }'
}

back_backnum73()
{
        back_option_number "73" "$@" | awk -F:: '{ print $3 }'
}

back_backnum74()
{
        back_option_number "74" "$@" | awk -F:: '{ print $3 }'
}

back_backnum75()
{
        back_option_number "75" "$@" | awk -F:: '{ print $3 }'
}

back_backnum76()
{
        back_option_number "76" "$@" | awk -F:: '{ print $3 }'
}

back_backnum77()
{
        back_option_number "77" "$@" | awk -F:: '{ print $3 }'
}

back_backnum78()
{
        back_option_number "78" "$@" | awk -F:: '{ print $3 }'
}

back_backnum79()
{
        back_option_number "79" "$@" | awk -F:: '{ print $3 }'
}

back_backnum80()
{
        back_option_number "80" "$@" | awk -F:: '{ print $3 }'
}

back_backnum81()
{
        back_option_number "81" "$@" | awk -F:: '{ print $3 }'
}

back_backnum82()
{
        back_option_number "82" "$@" | awk -F:: '{ print $3 }'
}

back_backnum83()
{
        back_option_number "83" "$@" | awk -F:: '{ print $3 }'
}

back_backnum84()
{
        back_option_number "84" "$@" | awk -F:: '{ print $3 }'
}

back_backnum85()
{
        back_option_number "85" "$@" | awk -F:: '{ print $3 }'
}

back_backnum86()
{
        back_option_number "86" "$@" | awk -F:: '{ print $3 }'
}

back_backnum87()
{
        back_option_number "87" "$@" | awk -F:: '{ print $3 }'
}

back_backnum88()
{
        back_option_number "88" "$@" | awk -F:: '{ print $3 }'
}

back_backnum89()
{
        back_option_number "89" "$@" | awk -F:: '{ print $3 }'
}

back_backnum90()
{
        back_option_number "90" "$@" | awk -F:: '{ print $3 }'
}

back_backnum91()
{
        back_option_number "91" "$@" | awk -F:: '{ print $3 }'
}

back_backnum92()
{
        back_option_number "92" "$@" | awk -F:: '{ print $3 }'
}

back_backnum93()
{
        back_option_number "93" "$@" | awk -F:: '{ print $3 }'
}

back_backnum94()
{
        back_option_number "94" "$@" | awk -F:: '{ print $3 }'
}

back_backnum95()
{
        back_option_number "95" "$@" | awk -F:: '{ print $3 }'
}

back_backnum96()
{
        back_option_number "96" "$@" | awk -F:: '{ print $3 }'
}

back_backnum97()
{
        back_option_number "97" "$@" | awk -F:: '{ print $3 }'
}

back_backnum98()
{
        back_option_number "98" "$@" | awk -F:: '{ print $3 }'
}

back_backnum99()
{
        back_option_number "99" "$@" | awk -F:: '{ print $3 }'
}

back_backnum100()
{
        back_option_number "100" "$@" | awk -F:: '{ print $3 }'
}
