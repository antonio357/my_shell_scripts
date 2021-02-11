#!/bin/bash

echo "are you sure, its gona remove all teste cases as well"
echo "continue / cancel : y / n"
read arg

case $arg in
    "y")
        for dir in `ls test_cases -p | grep /`; do
            if [ -z $dir ]; then
                dir=`echo ${dir/'/'/}`
                rm $dir/*
            fi
        done
        echo "all directories were cleared"
    ;;
    "n")
        echo "canceled"
    ;;
esac
