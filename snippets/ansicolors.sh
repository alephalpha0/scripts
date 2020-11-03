# https://linuxhint.com/tput-printf-and-shell-expansions-how-to-create-awesome-outputs-with-bash-scripts/

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

fgBLack=$(tput setaf 0) # black
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
