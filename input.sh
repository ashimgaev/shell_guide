#!/bin/sh

source ./helpers.sh

########################################
# 0, STDIN — standard input
# 1, STDOUT — standard output
# 2, STDERR — error output
########################################


MY_NAME=alex

# echo without new line
#echo -n "Enter your name: "
#read MY_NAME
#echo "Hello $MY_NAME, welcome to my program."
#separator

# Redirect STDIN to file
echo "Redirect STDIN to file (read from file)"
echo "This line is from file" > $G_FILE_FOR_WRITE
exec 0< $G_FILE_FOR_WRITE
while read var_line
do
echo "Read line: $var_line"
done
separator


