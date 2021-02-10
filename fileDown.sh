#!/bin/sh

##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# lovely variables ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
file2dl="${1}"
directory=""
dlmethod=""

youtube-dl="/data/data/com.termux/files/home/bin/youtube-dl"


printLine() {
	echo ":::::::::::::::::::::::::::::::::::::::::::::::::::::::"
	return 0;
}

##;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
# the logic train of the script cho cho ;;;;;;;;;;;;;;;;;;;;;;
if [ -z "${file2dl}" ]; then
  echo "I wasnt passed a valid url."
  return 1
fi

printLine
echo "What directory to download to?"
printLine
read -r directory

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
read -r dlmethod
echo "${dlmethod}"
while [ "${dlmethod}" -gt 2 ] || [ "${dlmethod}" -lt 1 ]
do
  echo "(:::!:::) Make a valid selection. ::::::::::::::::::::::"
  read -r dlmethod
done

case "${dlmethod}" in
  1)
    printLine
    echo "Downloading file via wget into ~/${directory}"
    wget "${file2dl}"
    exit 0
  ;;
  2)
    printLine
    echo "Downloading youtube[music] link into mp3"
    "${youtube-dl}" --restrict-filenames -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 -c "${file2dl}" -o "%(title)s.%(ext)s"
    exit 0
  ;;
  *)
    echo "What the actual fuck did you do man?!?!"
    exit 1
  ;;
esac
