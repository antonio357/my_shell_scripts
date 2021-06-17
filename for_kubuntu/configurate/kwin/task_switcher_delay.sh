#!/bin/bash
# this scrit controls task switcher delay to pop up on screen

echo "type one of the following arguments"
echo "default) restores the delay time to its defalut"
echo "remove) remove the delay"
echo "info) information abaut this scrit"
echo ""

read arg

case $arg in
    "info")
        echo "this script controls task switcher delay to pop up on screen"
    ;;
    "default") # activate delay to its default 90ms
        kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key DelayTime 90
		echo "activated delay to its default 90ms"
		echo "kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key DelayTime 90"
    ;;
    "remove") # remove delay 
    kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key DelayTime 0
		echo "removed delay"
		echo "kwriteconfig5 --file ~/.config/kwinrc --group TabBox --key DelayTime 0"
    ;;
esac
