#!/bin/bash

# 检测指令是否存在
checkCommand()
{
    CommandList=$1
    
    if [[ $CommandList == "" ]]; then
        echoError "checkCommand missing operand"
        exit 1
    fi
    
    for Command in $CommandList; do
        if ( type -p $Command &> /dev/null ); then
            if [ ! -L $(type -p $Command) ]; then
                chmod 755 $(type -p $Command)
            else
                chmod 755 $(ls -l $(type -p $Command) | awk '{ print $NF }')
            fi
        else
            echoError "$Command not found"
            exit 1
        fi
    done
}

# 获取文件及路径
filePath()
{
    Path=$1
    
    if [[ $Path == "" ]]; then
        echoError "filePath missing operand"
        exit 1
    fi
    
    File=$(echo $Path | awk -F/ '{ print $NF }')
    Directory=$(echo $Path | sed "s/$File$//g")
    
    if [[ $2 == "-f" ]]; then
        echo $File
    else
        echo $Directory
    fi
}

# 计时
# 字颜色：30 黑 31 红 32 绿 33 黄 34 蓝 35 紫 36 天蓝 37 白
# 字背景：40 黑 41 红 42 绿 43 黄 44 蓝 45 紫 46 天蓝 47 白
timeUsed()
{
    if [[ $START != "" ]]; then
        END=$(date "+%s")
        minutes=$(( (END - START) / 60 ))
        seconds=$(( (END - START) % 60 ))
        
        echo -n -e "\e[$3;$1m$minutes\e[0m"
        echo -n -e "\e[$3;$2m minutes \e[0m"
        echo -n -e "\e[$3;$1m$seconds\e[0m"
        echo -e    "\e[$3;$2m seconds\e[0m"
    fi
}

myTime() { timeUsed 33 32 0; }
