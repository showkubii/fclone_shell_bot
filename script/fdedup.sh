#!/bin/bash
#=============================================================
# https://github.com/cgkings/fclone_shell_bot
# File Name: fdedup.sh
# Author: cgking
# Created Time : 2020.7.8
# Description:定向查重
# System Required: Debian/Ubuntu
# Version: final
#=============================================================

source /root/fclone_shell_bot/myfc_config.ini
clear
read -p "请输入要查重的链接==>" link
if [ -z "$link" ] ; then
    echo "不允许输入为空" && exit
else
link=${link#*id=};link=${link#*folders/};link=${link#*d/};link=${link%?usp*}
fi
echo -e "▣▣▣▣▣▣正在执行查重▣▣▣▣▣▣"
fclone dedupe newest "$fclone_nameb":{$link2} --fast-list --size-only --drive-use-trash=false --no-traverse --checkers="$fs_chercker" --transfers="$fs_transfer" -p --log-level=ERROR --log-file=/root/fclone_shell_bot/log/fdedupe.log --check-first
echo "|▉▉▉▉▉▉▉▉▉▉▉▉|100%  查重完毕"