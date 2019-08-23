#!/bin/bash
# Script to delete data from tmp when it is 90 % full.
# Version 0.1

dt=`date +"%Y_%m_%d_%H_%M_%S"`
echo "Starting The Activity at `date`" > ${dt}.log
usage=`df -k /tmp | tail -1 | awk '{print $4}' | cut -d'%' -f1`
echo "File System Usage for temp: ${usage}%" >> ${dt}.log
if [ $usage -ge 90 ]; then
	echo -e "\nThis Folder need to be cleaned" >> ${dt}.log
	#mail -s "Alert folder need to be cleaned" mail@emailid.com
	echo -e "\nListing the directory:- " >> ${dt}.log
	ls -latr /tmp/* >> ${dt}.log
	echo -e "Cleaning the folder " >> ${dt}.log
	rm -rf /tmp/* >> ${dt}.log
	else
	echo "This Folder is having enough space. No need to cleaned up" >> ${dt}.log
fi
