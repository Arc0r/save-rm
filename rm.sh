#!/bin/bash
STORE=$(mktemp -d)
FILES=$@
mv $FILES $STORE
echo "Files are removed savely"
echo $STORE $FILES   >> ~/.cache/save_rm.cache

