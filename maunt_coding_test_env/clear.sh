#!/bin/bash

echo "are you sure, its gona remove all teste cases as well"
echo "continue / cancel : y / n"
read arg

case $arg in
    "y")
        for dir in `ls -p | grep /`; do
            dir=`echo ${dir/'/'/}`
            rm $dir/*
            echo "$dir/*"
        done
        echo "all directories were cleared"
    ;;
    "n")
        echo "canceled"
    ;;
esac
