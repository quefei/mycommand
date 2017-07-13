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
checkCommand quenong-md5 mypath mydir mymake mydown mytime myopt myletter

# 查找 myoption.sh 文件
myOption()
{
    MyOption=$(find ~/.[A-Za-z0-9_]*/ -name "myoption.sh" -type f | sed -n "1p")
    
    if [[ $MyOption != "" ]]; then
        . $MyOption
        grep "longOption()" $MyOption &> /dev/null || longOption() { :; }
        grep "longArgument()" $MyOption &> /dev/null || longArgument() { :; }
        grep "shortOption()" $MyOption &> /dev/null || shortOption() { :; }
        grep "shortArgument()" $MyOption &> /dev/null || shortArgument() { :; }
        grep "argumentEnd()" $MyOption &> /dev/null || argumentEnd() { :; }
        grep "argumentTwo()" $MyOption &> /dev/null || argumentTwo() { :; }
    else
        longOption()
        {
            echoColor "Long Option:    $1" "31" "40"
        }

        longArgument()
        {
            echoColor "Long Argument:  $1" "35" "40"
        }

        shortOption()
        {
            echoColor "Short Option:   $1" "32" "40"
        }

        shortArgument()
        {
            echoColor "Short Argument: $1" "33" "40"
        }

        argumentEnd()
        {
            echoColor "Argument End:   $1" "36" "40"
        }

        argumentTwo()
        {
            echoColor "Argument Two:   $1" "34" "40"
        }
    fi
}
