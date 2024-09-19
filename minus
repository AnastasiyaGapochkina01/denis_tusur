#!/bin/bash

if [ $# -ne 2 ]; then
  echo "ERROR: You need to enter two numbers"
  exit 1
fi

if ! [[ $1 =~ ^[0-9]+$ ]] || ! [[ $2 =~ ^[0-9]+$ ]]; then
  echo "ERROR: both numbers must be integers"
  exit 1
fi

SCRIPT_NAME=$(basename "$0")

case $SCRIPT_NAME in
  sum)
    RESULT=$(( $1 + $2 ))
    ;;
  minus)
    RESULT=$(( $1 - $2 ))
    ;;
  *)
    echo "ERROR: the script must be run with an argument 'sum' or 'minus'"
    exit 1
    ;;
esac

echo "Res: $RESULT"
