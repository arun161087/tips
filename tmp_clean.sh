#!/bin/bash
# Script to delete data from tmp when it has more than 500 Mb data.
# Version 0.1
dt=`date +"%Y_%m_%d_%H_%M_%S"`
echo "Starting The Activity at `date`" > ${dt}.log
usage2=`du -smh /fusion/temp/ | tail -1 | awk '{print $1}' | cut -d'M' -f1`
echo "File System Usage for temp: ${usage2}Mb" >> ${dt}.log
if [ $usage2 -ge 500 ]; then
	echo -e "\nThis Folder need to be cleaned" >> ${dt}.log
	echo -e "\nListing the directory:- " >> ${dt}.log
	ls -latr /fusion/temp/* >> ${dt}.log
	echo -e "Cleaning the folder " >> ${dt}.log
	rm -rf /fusion/temp/* >> ${dt}.log
	usage2=`du -smh /fusion/temp/ | tail -1 | awk '{print $1}'`
	echo "Current Size of folder: ${usage2}"
else
	echo "This Folder is having enough space. No need to cleaned up" >> ${dt}.log
fi
