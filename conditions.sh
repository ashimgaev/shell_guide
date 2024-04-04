#!/bin/sh

source ./helpers.sh

######################################
# $1 - file path
######################################
test_file() {
  # $1	first argument, $2 - second etc...
  FILE_PATH=$1
  echo "check file ${FILE_PATH}"

# -b True if the FILE exists and is a special block file.
# -c True if the FILE exists and is a special character file.
# -d True if the FILE exists and is a directory.
# -e True if the FILE exists and is a file, regardless of type (node, directory, socket, etc.).
# -f True if the FILE exists and is a regular file (not a directory or device).
# -G True if the FILE exists and has the same group as the user running the command.
# -h True if the FILE exists and is a symbolic link.
# -g True if the FILE exists and has set-group -id (sgid) flag set.
# -k True if the FILE exists and has a sticky bit flag set.
# -L True if the FILE exists and is a symbolic link.
# -O True if the FILE exists and is owned by the user running the command.
# -p True if the FILE exists and is a pipe.
# -r True if the FILE exists and is readable.
# -S True if the FILE exists and is a socket.
# -s True if the FILE exists and has nonzero size.
# -u True if the FILE exists and set-user-id (suid) flag is set.
# -w True if the FILE exists and is writable.
# -x True if the FILE exists and is executable.

  if [ -e $FILE_PATH ]
  then
    echo "The file exists"
  else
    echo "Not exists"
  fi

  if [ -d $FILE_PATH ]
  then
    echo "The file is directory"
  else
    echo "Not a directory"
  fi

  if [ -f $FILE_PATH ]
  then
    echo "The file is a regular file"
  else
    echo "Not a regular file"
  fi

  if [ -r $FILE_PATH ]
  then
    echo "Can read"
  else
    echo "Can't read"
  fi

  if [ -w $FILE_PATH ]
  then
    echo "Can write"
  else
    echo "Can't write"
  fi

  if [ -x $FILE_PATH ]
  then
    echo "Can execute"
  else
    echo "Can't execute"
  fi
}

######################################
# $1 - param name
# $2 - param value
######################################
test_int() {
  # $1	first argument, $2 - second etc...
  PARAM_NAME=$1
  PARAM_VAL=$2
  echo "check param ${PARAM_NAME} with value ${PARAM_VAL}"

  # &&	Logical AND
  # -eq	Equality check
  # -ne	Inequality check
  # -lt	Less Than
  # -le	Less Than or Equal
  # -gt	Greater Than
  # -ge	Greater Than or Equal
  if [ $PARAM_VAL -eq 1 ]
  then
    echo "${PARAM_NAME} equal to 1"
  elif [ $PARAM_VAL -lt 1 ]
  then
    echo "${PARAM_NAME} less than 1"
  else
    echo "${PARAM_NAME} greater than 1"
  fi
}

######################################
# $1 - param name
# $2 - param value
######################################
test_str() {
  # $1	first argument, $2 - second etc...
  PARAM_NAME=$1
  PARAM_VAL=$2
  echo "check param ${PARAM_NAME} with value ${PARAM_VAL}"

  # &&	Logical AND
  # -eq	Equality check
  # -z  Checks if string is null or empty
  # -n  Check if string is not null
  # =  true if str1 == str2
  # !=  true if str1 != str2
  # >  true if str1 > str2
  # <  true if str1 < str2

  if [ -z "${PARAM_VAL}" ]
  then
    echo "${PARAM_NAME} is empty"
  else
    echo "${PARAM_NAME} not empty"
  fi

  if [ "$PARAM_VAL" = "abc" ]
  then
    echo "${PARAM_NAME} is equal to abc"
  else
    echo "${PARAM_NAME} not equal to abc"
  fi

  if [ "$PARAM_VAL" \> "ab" ]
  then
    echo "${PARAM_NAME} > ab"
  fi

  if [ "$PARAM_VAL" \< "abcd" ]
  then
    echo "${PARAM_NAME} < abcd"
  fi
}


# set defaul vlues for variables
VAR_PARAM_1=0
echo "#############"
echo "Test integers..."
VAR_PARAM_1=1
test_int 'VAR_PARAM_1' ${VAR_PARAM_1}
VAR_PARAM_1=0
test_int 'VAR_PARAM_1' ${VAR_PARAM_1}
VAR_PARAM_1=2
test_int 'VAR_PARAM_1' ${VAR_PARAM_1}

echo "#############"
echo "Test strings..."
VAR_PARAM_1=
test_str 'VAR_PARAM_1' ${VAR_PARAM_1}
VAR_PARAM_1=abc
test_str 'VAR_PARAM_1' ${VAR_PARAM_1}
VAR_PARAM_1=cba
test_str 'VAR_PARAM_1' ${VAR_PARAM_1}

echo "#############"
echo "Test files..."
VAR_PARAM_1='./dir_1'
test_file ${VAR_PARAM_1}
echo "_____"
VAR_PARAM_1='./dir_1/file_1.txt'
test_file ${VAR_PARAM_1}
echo "_____"
VAR_PARAM_1='./dir_1/file_not_exists.txt'
test_file ${VAR_PARAM_1}