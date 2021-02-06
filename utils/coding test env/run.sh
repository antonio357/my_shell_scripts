#!/bin/bash

g++ algo.cpp -o algo.out;
echo "compiled";

rm results/*
echo "removed old results"

for file in `ls test_cases | grep -v "expected_" | sort`; do
    result_file="result_"
    result_file+=$file
    echo "time $result_file"
    cat test_cases/$file | time ./algo.out >> results/$result_file
done
echo "added new results";

rm diffs/*
echo "removed old diffs"

echo "running diff";
for file in `ls test_cases | grep "expected_" | sort`; do
    expected=test_cases/$file
    results=results/`echo "${file/expected_/result_}"`
    df=`diff $expected $results -y -q`
    if [ "$df" ]; then
        expected_df=`echo "${expected/.txt/}"`
        results_df=`echo "${results/.txt/}"`
        expected_df=`echo "${expected_df/'test_cases/'/}"`
        results_df=`echo "${results_df/'results/'/}"`
        df=""
        df+="diff "
        df+="$expected_df "
        df+=$results_df
        df+=".txt"
        echo $df
        diff $expected $results >> "diffs/$df"
        echo "\n --------------------- \n" >> "diffs/$df"
        diff $expected $results -y >> "diffs/$df"
    fi
done
echo "done";
