#!/bin/bash
STORE=$(mktemp)
mv $@ $STORE
echo "Files are removed savely"
