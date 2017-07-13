#!/bin/bash

# 检测指令是否存在
checkCommand()
{
    CommandList="$*"
    
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

# 运行函数
checkCommand quenong-md5 mypath mydir mymake mydown mytime
