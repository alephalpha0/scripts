#!/bin/bash
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# NAME: fileDowmn ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# DESC: Downloads files passed to it, tagging mp3s as needed.  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# CREATED: 2021-01-10 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# MODIFIED: 2021-02-21 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# CONTACT: alephalpha0@tutanota.com && https://github.com/alephalpha0 ;;;;;;;;;;;;;;;;;;;;;;;;#
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# Many thanks to those who have shared and discussed their dotfiles/source code/scripts on    #
# blogs, stackoverflow, dev.to, gitlab/github, and on any open forum for ideas on the world   #
# wide web. I am continually learning and finding new things because of you.                  #
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#
# fileDown - Downloads URLs passed to it, using wget and youtube-dl. Tags MP3s TOO!.
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
# (String) The URL passed to the script ;;;;;;;;;;;;;;;;;;;;;;
file2dl="${1}"
# (String) The local directory to download into. ;;;;;;;;;;;;;
directory=""
# (Int) The User Selected Download Method. ;;;;;;;;;;;;;;;;;;;
dlmethod=""
# (String) The createdMP3 file ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mp3File=""


printLine() {
	echo "::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
	return 0;
}

##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# the logic train of the script cho cho ;;;;;;;;;;;;;;;;;;;;;;
if [ -z "${file2dl}" ]; then
  echo "I wasnt passed a valid url."
  return 1
fi

printLine
echo "        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░2 "
echo "        ░█▀▀░▀█▀░█░░░█▀▀░█▀▄░█▀█░█░█░█▀█░0 "
echo "        ░█▀▀░░█░░█░░░█▀▀░█░█░█░█░█▄█░█░█░2 "
echo "        ░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀▀▀░▀░▀░▀░▀░1 "
printLine
echo "::::::::: What directory to download to? :::::::::::::::"
printLine
read -r directory
printLine
echo "Downloading into:" "${directory}"
if [ -d "${HOME}/${directory}" ]; then
  cd "${HOME}/${directory}" || exit $?
else
  mkdir "${HOME}/${directory}"
  cd "${HOME}/${directory}" || exit $?
fi
printLine
echo "::::::::: What method are we using today? ::::::::::::::"
echo "(:::1:::) WGET:: single file download. :::::::::::::::::"
echo "(:::2:::) YOUTUBE-DL:: music into mp3. :::::::::::::::::"
echo "(:::3:::) YOUTUBE-DL:: single mp4 download :::::::::::::"
read -r dlmethod
while [ "${dlmethod}" -gt 3 ] || [ "${dlmethod}" -lt 1 ]
do
  echo "(:::!:::) Make a valid selection. ::::::::::::::::::::::"
  read -r dlmethod
done

case "${dlmethod}" in
  1)
    printLine
    echo "::::::::: Downloading file via wget into ~/${directory}"
    wget "${file2dl}"
    exit 0
  ;;
  2)
    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    # MP3 RENAMING AND TAGGING VARIABLES ;;;;;;;;;;;;;;;;;;;;;;;;;
    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    # (String) Date this ripping occured. ;;;;;;;;;;;;;;;;;;;;;;;;
    ripDate=""
    # (String) Artist Name ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mp3Artist=""
    # (String) Song Title ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    mp3Title=""
    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    # Get the current date for the rip date.
    printf -v ripDate '%(%B %d, %Y)T' -1

    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    # GETTING MP3 ARTIST AND TITLE FOR TAGGING ;;;;;;;;;;;;;;;;;;;
    printLine
    echo "::::::::: Artist name? ::::::::::::::::::::::::::::::::::"
    printLine
    read -r mp3Artist
    while [ -z "${mp3Artist}" ]; do
      echo "(:::!:::) Enter a valid string. ::::::::::::::::::::::::"
      read -r mp3Artist
    done
    printLine
    echo "::::::::: Song title? :::::::::::::::::::::::::::::::::::"
    printLine
    read -r mp3Title
    while [ -z "${mp3Title}" ]; do
      echo "(:::!:::) Enter a valid string. ::::::::::::::::::::::::"
      read -r mp3Title
    done
    ## END USER INPUT FOR TAGGING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    # DOWNLOAD FILE AND ENCODE INTO MP3 ;;;;;;;;;;;;;;;;;;;;;;;;;;
    echo "Downloading youtube[music] link into mp3 :::::::::::::"
    youtube-dl --restrict-filenames -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -c "${file2dl}" -o "${mp3Artist}"'-'"${mp3Title}"'.%(ext)s'
    mp3File="${mp3Artist}"'-'"${mp3Title}"'.mp3'
    printLine
    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    # MP3 TAGGING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    echo "Writing default id3 tags. ::::::::::::::::::::::::::::"
    
    mid3v2 -ve -a "${mp3Artist}" -t "${mp3Title}" -A 'Youtube-DL Rips' -c 'Ripped from Youtube via youtube-dl and encoded with ffmpeg on '"${ripDate}"' by alephalpha0 (alephalpha0@tutanota.com). Mors certa; vita incerta.' "${mp3File}"
    

    # END MP3 TAGGING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    #exit 0
  ;;
  3)
    printLine
    echo "Downloading youtube link into mp4 ::::::::::::::::::::"
    youtube-dl --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4 "${file2dl}"
  ;;
  *)
    echo "What the actual fuck did you do man?!?! ::::::::::::::"
    exit 1
  ;;
esac
