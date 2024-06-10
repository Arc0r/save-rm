#!/bin/bash
STORE=$(mktemp)
FILES=$@
mv $FILES $STORE
echo "Files are removed savely"
echo $STORE $FILES   >> ~/.cache/save_rm.cache

