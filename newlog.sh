#!/bin/bash
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# NAME: newlog ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# DESC: Automatic creation of frontmattered MD files for the masses. ;;;;;;;;;;;;;;;;;;;;;;;;;#
# CREATED: 2021-02-10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# MODIFIED: 2021-02-20 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# CONTACT: alephalpha0@tutanota.com && https://github.com/alephalpha0 ;;;;;;;;;;;;;;;;;;;;;;;;#
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# Many thanks to those who have shared and discussed their dotfiles/source code/scripts on    #
# blogs, stackoverflow, dev.to, gitlab/github, and on any open forum for ideas on the world   #
# wide web. I am continually learning and finding new things because of you.                  #
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# newlog - generate a frontmattered new log file.
# Copyright (C) 20201  alephalpha0 [alephalpha0@tutanota.com]

# This program is free software: you can redistribute it and/or modify it under the terms of 
# the GNU General Public License as published by the Free Software Foundation, either version 
# 3 of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
# See the GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along with this program. 
# If not, see <https://www.gnu.org/licenses/>.


##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# LOVELY VARIABLES ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# (String) Will be the new log entry's Date. ;;;;;;;;;;;;;;;;;
logDate=""
# (String) Newlog entry's date formatted for it's metadata. ;;
metaDate=""
# (String) Will be the new log entry's title. ;;;;;;;;;;;;;;;;
logTitle=""
# (String) Combines $logDate + - + $logTitle + .md ;;;;;;;;;;;
fullTitle=""


EDITOR="/data/data/com.termux/files/usr/bin/micro"

##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# the logic train of the script cho cho ;;;;;;;;;;;;;;;;;;;;;;
##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
if [ -d /data/data/com.termux/files/home/writing ]; then
  cd /data/data/com.termux/files/home/writing || exit $?
  echo "  ▗▄ ▗▖          ▗▖"
  echo "  ▐█ ▐▌          ▐▌"
  echo "  ▐▛▌▐▌ ▟█▙ █   █▐▌    ▟█▙  ▟█▟▌"
  echo "  ▐▌█▐▌▐▙▄▟▌▜ █ ▛▐▌   ▐▛ ▜▌▐▛ ▜▌"
  echo "  ▐▌▐▟▌▐▛▀▀▘▐▙█▟▌▐▌   ▐▌ ▐▌▐▌ ▐▌"
  echo "  ▐▌ █▌▝█▄▄▌▝█ █▘▐▙▄▄▖▝█▄█▘▝█▄█▌"
  echo "  ▝▘ ▀▘ ▝▀▀  ▀ ▀ ▝▀▀▀▘ ▝▀▘  ▞▀▐▌"
  echo "                            ▜█▛▘"
  echo "New blog's title? No whitespace, use -."
  read logTitle
  printf -v logDate '%(%Y-%m-%d)T' -1
  printf -v metaDate '%(%Y-%m-%d %H:%M)T' -1
  fullTitle="$logDate"-"$logTitle".md
  touch "${fullTitle}"
  echo "Title:" >> "${fullTitle}"
  echo "Date:" $metaDate >> "${fullTitle}"
  echo "Category: Blog" >> "${fullTitle}"
  echo "Tags:" >> "${fullTitle}"
  echo "Summary:" >> "${fullTitle}"
  echo "Location:" >> "${fullTitle}"
  echo "Status: Published" >> "${fullTitle}"
  echo "" >> "${fullTitle}"
  $EDITOR "${fullTitle}"
fi
