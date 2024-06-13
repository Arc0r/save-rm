#!/bin/bash

if [ -z "$1" ]; then
  # No arguments were passed, so print a help message
  echo "Usage: save_rm.sh [command|filename]"
  echo "Commands:"
  echo "  -l    List the deleted files."
  echo "  -c    Clean the cached files."
  echo "  -h    Show this help message."
  exit 1
fi

# Get the command from the first argument
command="$1"
CACHEFILE="/tmp/cache_saverm"

# Check the command and take appropriate action
case $command in
  -l)
    cat $CACHEFILE
    exit 0
    ;;
  -c)
    while read line
    do 
      rm $(echo $line|awk '{print $2}')
    done < .cache/save_rm.cache
    echo "Removed cached files"
    exit 0
    ;;
  -h)
    echo "Usage: save_rm.sh [command|filename]"
    echo "Commands:"
    echo "  -l    List the deleted files."
    echo "  -c    Clean the cached files."
    echo "  -h    Show this help message."
    exit 0
    ;;
  *)
    STORE=$(mktemp -d)
    FILES=$@
    for FILE in $FILES
      $FILE = readlink -f $FILE
      do
        if [[ -f "$FILE" || -d "$FILE" ]]; then
          mv $FILE $STORE/
          SIZE=$(du -sh $STORE)
          echo "Files are removed savely"
          echo $SIZE $FILE   >> $CACHEFILE
        fi
      done
    exit 0
    ;;
esac

