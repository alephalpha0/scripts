[![CodeFactor](https://www.codefactor.io/repository/github/alephalpha0/scripts/badge)](https://www.codefactor.io/repository/github/alephalpha0/scripts)
# alephalpha0's scripts.

#### `newlog.sh` is a general script to get the new blog entry's title from stdin and concatenate the current date to the beginning and `.md` to the end and open the resulting file in `$EDITOR`. Wham bam, thank ya ma'am. 

#### `fileDown.sh` is the baby beginnings of my third round with creating a script for passing URLs to termux via the android share menu. Requires `wget` and `youtube-dl` at this point in history. 

#### `figFont.sh` is an almost useless script that takes a FIGlet font file name and outputs the banner text to a static file, and the command to regenerate the banner.

----
  
## Sources used for reference: 
+ [ebook: TLDP's advanced bash scripting guide](https://tldp.org/LDP/abs/html/abs-guide.html) - an entire book's worth of reference in one `.html` file. Excellent explanations. 
+ [article: tput, printf, and shell expansion](https://linuxhint.com/tput-printf-and-shell-expansions-how-to-create-awesome-outputs-with-bash-scripts/) - well written article over formatting text for shell scripts. Build better TUIs. 
+ [cheatsheet: bash](https://devhints.io/bash) - Cheatsheet over most common parts of Bash scripting. 
+ [wiki: bash hackers](https://wiki.bash-hackers.org) - Incredibly in depth wiki over all aspects of using and scripting Bash. 
+ [article: creating a bash script template](https://opensource.com/article/19/12/bash-script-template) - article covers setting up your header and various generic **blocks** in your code for variables, functions, etc.. as well as license and a help feature. etc etc etc.  
+ RE: ERROR / EXIT / RETURN CODES&STATUS => [this article](https://shapeshed.com/unix-exit-codes/) && [this Appendix of TLDP.org's ABSG](https://tldp.org/LDP/abs/html/exitcodes.html) 
+ [FAQ: comp.unix.shell circa 2005](http://cfajohnson.com/shell/cus-faq.html#Q0b]) - Oldie but still stock chock full of knowledge vitamins. Gotta love the fact that a 15+ year old FAQ from usenet still is relevent and topical while it approaches the legal age of consent. 
---------
#### Change Log Abridged:
> 2020-08-XX In the beginning there was `termux-url-opener` and `ropsync`. Neither were very good or interesting. I kept clobbering away at `termux-url-opener` and creating little explosion scripts trying to get my feet wet.
..

> 2021-01-XX [Termux](https://termux.com) is my main touchpoint and tool in teaching myself programming, maintaining content with a static site generator, and just general "sysadmin" type shit. Its ability to receive multiple data/URL/URI types shared from various apps and sources is continually sparking my imagination and showing me sidways routes to accomplish things I want. 
..

> 2021-02-10 After changing to another new phone, I am now using the Termux.widget to gain more functionality with my phone and brain.`newLog` is sitting happily symlinked to `~/.shortcuts` and being hacked together at random times. My logic train runs fairly well for it, and I'm oddly proud at what it produces. `fileDown` is the next incarnation of the script I have Termux use to handle URLs passed to it. Somewhere along the way it dawned on me to use symbolic links so I didn't have to be constrained to default expectations while still fulfilling them.  

> 2021-02-19 I made figFont.sh because I wanted to quickly get a local reference file for FIGlet font styles. 
