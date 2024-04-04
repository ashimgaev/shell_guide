#!/bin/sh

source ./helpers.sh

echo The 0 param is name of script: $0
echo There were $# parameters passed.
echo The last parameter was ${!#}
echo "All argiments as one word: $*"
echo start loop...
for item in "$*"
do
echo $item
done
echo "All argiments as list: $@"
echo start loop...
for item in "$@"
do
echo $item
done

# function to print help
function usage {
    echo "usage: $0 [--param1] [--param2]"
    echo "  --param1    TBD"
    echo "  --param2    TBD"
    echo "  --help      display help"
    exit 1
}

# set defaul vlues for variables
VAR_PARAM_1=0
VAR_PARAM_2=0

# extract arguments cycle
while [ -n "$1" ]
    do
    echo handle argument $1
    case "$1" in
        --param1) 
        VAR_PARAM_1=1
        shift ;;
        --param2) 
        VAR_PARAM_2=1
        shift ;;
        --help) 
        usage
        shift ;;
        *) 
        shift ;;
    esac
done

echo "extract VAR_PARAM_1 = ${VAR_PARAM_1}"
echo "extract VAR_PARAM_2 = ${VAR_PARAM_2}"

