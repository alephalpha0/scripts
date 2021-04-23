### initial: 
#	#1: run the SSG of choice
#	#2: copy output to Android
#	#3: sftp (if it'll fucking work) output to host

if [ $OPTIN == 1 ]; then
  echo "No options passed."
  echo "Usage: rootofpi [$SSG]"
else





## PART 2 : THE COPYING OF THE FILES!

cp -rvp ~/${siteOutputPath}/ ~/${siteCopyPath}/
