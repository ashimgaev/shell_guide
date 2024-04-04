#!/bin/sh

source ./helpers.sh

########################################
# 0, STDIN — standard input
# 1, STDOUT — standard output
# 2, STDERR — error output
########################################


COLOR_RED='\e[1;31m'
COLOR_GREEN='\e[1;32m'
COLOR_BLUE='\e[1;34m'
NO_COLOR='\033[0m' # No Color

echo -e "${COLOR_RED}This is red string${NO_COLOR}"
echo -e "${COLOR_GREEN}This is green string${NO_COLOR}"

# echo without new line
echo -n "echo 1 "
echo "echo 2"



#############  Output to File ##########
# >  - output to file
# >>  - output and append to file
########################################
eecho "hello 1" > $G_FILE_FOR_WRITE
cat $G_FILE_FOR_WRITE
separator
echo "hello 2" > $G_FILE_FOR_WRITE
cat $G_FILE_FOR_WRITE
separator
echo "hello 1" > $G_FILE_FOR_WRITE
echo "hello 2" >> $G_FILE_FOR_WRITE
cat $G_FILE_FOR_WRITE
separator

#############  Redirect output ##########
echo Test redirect error to file
# Redirect errors to file
ls $G_FILE_NOT_EXISTS 2>$G_FILE_2
echo next text is from file
cat $G_FILE_2
separator
echo Test redirect STDERR to file2 redirect STDOUT to file1
# Redirect STDERR to file2 standard STDOUT to file1
ls $G_FILE_WITH_DATA $G_FILE_NOT_EXISTS 2>$G_FILE_2 1> $G_FILE_1
echo ls command has been executed
echo next text is from $G_FILE_2
cat $G_FILE_2
echo next text is from $G_FILE_1
cat $G_FILE_1
separator

echo Test redirect STDERR and STDOUT to file1
# Redirect STDERR and STDOUT to file1
ls $G_FILE_WITH_DATA $G_FILE_NOT_EXISTS &> $G_FILE_1
echo ls command has been executed
echo next text is from $G_FILE_1
cat $G_FILE_1
separator


echo Test redirect STDOUT to STDERR
# Redirect STDERR and STDOUT to file2
echo 'some text' > $G_FILE_FOR_WRITE
cat $G_FILE_FOR_WRITE 2>&1
separator


# Custom output descriptor
echo "Test custom output (descriptor 3 is custom)"
exec 3>$G_FILE_FOR_WRITE
echo "This was written to descriptor 3" 1>&3
echo next text is from $G_FILE_FOR_WRITE
cat $G_FILE_FOR_WRITE
separator

echo Execute command and write output to variable
echo 'some text for cat' > $G_FILE_FOR_WRITE
MY_VAR=$(cat $G_FILE_FOR_WRITE)
echo "MY_VAR: $MY_VAR"
separator