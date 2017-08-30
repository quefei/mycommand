#!/bin/bash

############################################################
#
#  黑:30  红:31  绿:32  黄:33  蓝:34  紫:35  天蓝:36  白:37
#  黑:40  红:41  绿:42  黄:43  蓝:44  紫:45  天蓝:46  白:47
#
############################################################
START_TIME=$(date "+%s")


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
