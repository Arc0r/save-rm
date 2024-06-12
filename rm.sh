#!/bin/bash

if [ -z "$1" ]; then
  # No arguments were passed, so print a help message
  echo "Usage: todo.sh [command]"
  echo "Commands:"
  echo "  list   List the contents of the todo file."
  echo "  edit   Open the todo file in a text editor."
  echo "  -h     Show this help message."
  exit 1
fi

# Get the command from the first argument
command="$1"

# Check the command and take appropriate action
case $command in
  list)
    cat ~/.cache/save_rm.cache
    exit 0
    ;;
  -h)
    echo "Usage: todo.sh [command]"
    echo "Commands:"
    echo "  list   List the deleted files."
    echo "  -h     Show this help message."
    exit 0
    ;;
  *)
    STORE=$(mktemp -d)
    FILES=$@
    for FILE in $FILES
      do
        if [[ -f "$FILE" || -d "$FILE" ]]; then
          mv $FILE $STORE
          SIZE= df -h $STORE
          echo "Files are removed savely"
          echo $STORE $SIZE $FILE   >> ~/.cache/save_rm.cache
        fi
      done
    exit 0
    ;;
esac

