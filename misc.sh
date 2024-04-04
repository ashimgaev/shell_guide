#!/bin/sh

source ./helpers.sh

my_func() {
  echo "this is my func which returns 5"
  return 5
}

echo Test function return code
my_func
echo "return: $?"
separator

