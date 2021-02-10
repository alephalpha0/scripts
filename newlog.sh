#!/bin/bash

##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# lovely variables ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
title=""
fulltitle=""
yymmdd=""

EDITOR="/data/data/com.termux/files/usr/bin/micro"

##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# the logic train of the script cho cho ;;;;;;;;;;;;;;;;;;;;;;
if [ -d /data/data/com.termux/files/home/writing ]; then
  cd /data/data/com.termux/files/home/writing
  echo "New blog's title?"
  read title
  printf -v yymmdd '%(%Y-%m-%d)T' -1
  fulltitle="$yymmdd"-"$title".md
  touch "${fulltitle}"
  echo "Title: " >> "${fulltitle}"
  echo "Date: " >> "${fulltitle}"
  echo "Category: Blog" >> "${fulltitle}"
  echo "Tags: " >> "${fulltitle}"
  echo "Summary: " >> "${fulltitle}"
  echo "Location: " >> "${fulltitle}"
  echo "Status: Published" >> "${fulltitle}"
  $EDITOR "${fulltitle}"
fi
