#!/bin/bash

############################################################
#
#  黑:30  红:31  绿:32  黄:33  蓝:34  紫:35  天蓝:36  白:37
#  黑:40  红:41  绿:42  黄:43  蓝:44  紫:45  天蓝:46  白:47
#
############################################################


############################################################
#
#       全局变量
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
