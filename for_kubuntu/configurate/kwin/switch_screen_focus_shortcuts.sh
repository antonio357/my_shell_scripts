#!/bin/bash

# the switch screen focus shortcuts does not works out of the box
# to make then works
# System Settings > Window Management > Window Behavior > Focus
# Checkbox "Separete screen focus"

echo "type one of the following arguments"
echo "default) disable switch screen focus shortcuts"
echo "activate) enable switch screen focus shortcuts"
echo "info) information abaut this scrit"
echo ""

read arg

case $arg in
    "info")
        echo "this script turns on/off switch screen focus shortcuts"
    ;;
    "default") # disable switch screen focus shortcuts
        kwriteconfig5 --file ~/.config/kwinrc --group Windows --key SeparateScreenFocus false
        echo "switch screen focus shortcuts disabled"
    ;;
    "activate") # enable switch screen focus shortcuts 
        kwriteconfig5 --file ~/.config/kwinrc --group Windows --key SeparateScreenFocus true
        echo "switch screen focus shortcuts enabled"
    ;;
esac
