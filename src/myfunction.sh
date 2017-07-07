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
