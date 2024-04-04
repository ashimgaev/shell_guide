#!/bin/sh
source ./helpers.sh

test_local_var() {
    local LOCAL_VAR=999
    echo LOCAL_VAR from function: $LOCAL_VAR
}

test_global_var() {
    GLOBAL_VAR=222
    echo GLOBAL_VAR from function: $GLOBAL_VAR
}

VAR_1=1
VAR_2=2

echo Test 1
VAR_3=$[${VAR_1} + ${VAR_2}]
echo VAR_3 = ${VAR_3}
separator

echo Test 2
VAR_1=2
VAR_2=3
VAR_3=$[${VAR_1} * ${VAR_2}]
echo VAR_3 = ${VAR_3}
separator

echo Test 3
VAR_1=aaa
VAR_2=bbb
VAR_3=${VAR_1}${VAR_2}
echo VAR_3 = ${VAR_3}
separator

echo "Test 4 (test local var)"
test_local_var
echo Try print LOCAL_VAR: $LOCAL_VAR
separator

echo "Test 5 (test global var)"
test_global_var
echo Try print GLOBAL_VAR: $GLOBAL_VAR
separator