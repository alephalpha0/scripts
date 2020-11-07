#!/bin/bash
## execersize 2 from abg chapter 2
# displays system time & date, list all logged in users, give system uptime 
# & then logs it all in a file.

logfile=~/projects/scripts/exercises/sysData.txt

thetime=$(echo "Currently the time is: `date +%T`")
thedate=$(echo "Currently the date is: `date +%F`")
#termux only has the one user, current logged in. 
#theusers=$(echo "The currently logged in users are: `who`")
theusers=$(echo "The current logged in user is: `whoami`")
sysuptime=$(echo "System's current uptime is: `uptime`")
echo ${thetime}
echo ${thetime} >> $logfile
echo ${thedate}
echo ${thedate} >> $logfile
echo ${theusers}
echo ${theusers} >> $logfile
echo ${sysuptime}
echo ${sysuptime} >> $logfile
echo "<-------------------------------->" >> $logfile
exit 0
