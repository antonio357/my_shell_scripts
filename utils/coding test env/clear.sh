#!/bin/bash

test_cases="test_cases"

if [ $1 == $test_cases ]; then
    for dir in `ls test_cases -p | grep /`; do
        if [ -z $dir ]; then
            dir=`echo ${dir/'/'/}`
            rm $dir/*
        fi
    done
    echo "all directories were cleared"
else
    for dir in `ls test_cases -p | grep / | grep -v "test_cases"`; do
        if [ -z $dir ]; then
            dir=`echo ${dir/'/'/}`
            rm $dir/*
        fi
    done
    echo "all directories were cleared, except test_cases/"
fi
