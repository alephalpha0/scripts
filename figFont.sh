#!/bin/sh

fontName="${1}"
fileName="/data/data/com.termux/files/home/figlet.md"

echo "\`figlet -f" $fontName "\`" >> ${fileName}
echo "..." >> ${fileName}
echo "\`\`\`" >> ${fileName}
figlet -f ${fontName} alephalpha0 >> ${fileName}
echo "\`\`\`" >> ${fileName}
echo "..." >> ${fileName}
