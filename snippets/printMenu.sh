printMenu() {
    # background color using ANSI escape
    
    bgBlack=$(tput setab 0) # black
    bgRed=$(tput setab 1) # red
    bgGreen=$(tput setab 2) # green
    bgYellow=$(tput setab 3) # yellow
    bgBlue=$(tput setab 4) # blue
    bgMagenta=$(tput setab 5) # magenta
    bgCyan=$(tput setab 6) # cyan
    bgWhite=$(tput setab 7) # white
    
    # foreground color using ANSI escape
    
    fgBlack=$(tput setaf 0) # black
    fgRed=$(tput setaf 1) # red
    fgGreen=$(tput setaf 2) # green
    fgYellow=$(tput setaf 3) # yellow
    fgBlue=$(tput setaf 4) # blue
    fgMagenta=$(tput setaf 5) # magenta
    fgCyan=$(tput setaf 6) # cyan
    fgWhite=$(tput setaf 7) # white
    
    # text editing options
    
    txBold=$(tput bold)   # bold
    txHalf=$(tput dim)    # half-bright
    txUnderline=$(tput smul)   # underline
    txEndUnder=$(tput rmul)   # exit underline
    txReverse=$(tput rev)    # reverse
    txStandout=$(tput smso)   # standout
    txEndStand=$(tput rmso)   # exit standout
    txReset=$(tput sgr0)   # reset attributes
	local selection=4
	local lineplus="${bgBlue}${fgBlack}+++++++++++++++++++++++++++++++++++++++++++++++${txReset}"

	echo "${txBold}${bgBlue}${fgBlack}Welcome to alephalpha0's Download Menu ${txReset} ${txUnderline}v.0.2.0${txReset}"
	echo "${txHalf}+ Choose your download method option below:${txReset}"
	echo "${txHalf}+ Script defaults to 4.)${txReset}"
	echo "${lineplus}"
	echo "+ 1.) Youtube-DLC (Music)(MP3)(Conversion)"
	echo "+ 2.) Youtube-DLC (Video)(MP4)(Conversion)"
	echo "+ 3.) Youtube-DLC (Video)(Best Audio/Video)(No conversion)"
	echo "+ 4.) wget (Single File)"
	echo "+ 5.) wget (Single Page)(Mirror)"
	echo "${lineplus}"
	read -p "Number?:" selection
	# make sure to check for number entry!!
	return $selection
}
printMenu
