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
    touch $CACHEFILE
    cat $CACHEFILE
    exit 0
    ;;
  -c)
    while read line
    do 
      rm -rf $(echo $line|awk '{print $2}')
    done < $CACHEFILE
    echo "Removed cached files"
    rm -rf $CACHEFILE
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
      do
        if [[ -f "$FILE" || -d "$FILE" ]]; then
          mv $FILE $STORE/
          SIZE=$(du -sh $STORE)
          echo "Files are removed savely"
          echo $SIZE "$(readlink -f $FILE)"   >> $CACHEFILE
        fi
      done
    exit 0
    ;;
esac

