#!/bin/bash

for file in `ls test_cases | sort -r`; do
    last_test_case=$file
    break
done

if [ -e "test_cases/test_case_1.txt" ]; then
    case_test_num=`echo $last_test_case | sed 's/[^0-9]*//g'`
    new_case_test_num="$(($case_test_num + 1))"

    new_test_case_name=`echo "${last_test_case/$case_test_num/$new_case_test_num}"`
    else
        new_test_case_name="test_case_1.txt"
fi

new_test_case_name_expected="expected_"
new_test_case_name_expected+=$new_test_case_name

touch test_cases/$new_test_case_name
touch test_cases/$new_test_case_name_expected

echo "ignore this message"
kate -n test_cases/$new_test_case_name test_cases/$new_test_case_name_expected
echo "ignore this message"
