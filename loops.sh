#!/bin/sh

source ./helpers.sh

echo Simple test 1
for my_var in first second third
do
echo The $my_var item
done
echo my_var after loop is ${my_var}

echo "###########"
echo Simple test 2
for my_var in 1 2 3
do
echo The $my_var item
done
echo my_var after loop is ${my_var}

echo "###########"
echo Simple test 3
MY_LIST="first second third"
for my_var in $MY_LIST
do
echo The $my_var item
done
echo my_var after loop is ${my_var}

echo "###########"
echo Read list from a file with standard separator
MY_LIST=$(cat ./dir_1/file_for_loop.txt)
for my_var in $MY_LIST
do
echo $my_var
done

echo "###########"
echo Custom separator as ,
old_ifs="$IFS"
IFS=","
MY_LIST="first,second,third"
for my_var in $MY_LIST
do
echo $my_var
done
IFS="$old_ifs"

echo "###########"
echo Files in deirectory
TEST_DIR="./dir_1/*"
for file in ${TEST_DIR}
do
echo $file
done

echo "###########"
echo C style cycle
for (( i=1; i <= 3; i++ ))
do
echo "number is $i"
done

echo "###########"
echo while loop
var1=3
while [ $var1 -gt 0 ]
do
if [ $var1 -eq 2 ]
then
echo skip 2 and continue
var1=$[ $var1 - 1 ]
continue
fi
echo $var1
var1=$[ $var1 - 1 ]
done