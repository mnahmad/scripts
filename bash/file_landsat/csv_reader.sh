#!/bin/bash

# This scripts calculate total number of images for landsat 8 for a specific pathrows.
# the files are 
# 1. landsatrowpath.csv  = contains specific row path (in our case africa)
# 2. ls_on_date.csv = the output of the script on a specific date
# 3. total.csv = a cleaned version of ls_on_date.csv
# 4. total.csvt = csvt file to be used for GIS styling etc. 
 

clear

# Landsat row and path that we need the image numbers for. In this case, it is all Africa
INPUT=landsatrowpath.csv

OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

while read AREA PERIMETER PR_ PR_ID RINGS_OK RINGS_NOK WRSPR PR PATH ROW MODE DAYCLASS SEQUENCE
do
	#echo "Area : $AREA"
	#echo "PERIMETER : $PERIMETER"
	#echo "PR_ : $PR_"
	#echo "PR_ID : $PR_ID"
	#echo "RINGS_OK : $RINGS_OK"
	#echo "RINGS_NOK : $RINGS_NOK"
	#echo "WRSPR : $WRSPR"
	#echo "PR : $PR"
	#echo "PATH : $PATH"
	#echo "ROW : $ROW"
	#echo "MODE : $MODE"
	#echo "DAYCLASS : $DAYCLASS"
	#echo "SEQUENCE : $SEQUENCE"

	#echo "Path : $PATH"
	#echo "Row : $ROW"

	#img=/usr/local/bin/landsat search $PATH,$ROW | grep "total\":"

	echo $PR "#"
	#img=/usr/local/bin/landsat search -p $PATH,$ROW | /bin/grep "total\":"
	/usr/local/bin/landsat search -p $PATH,$ROW | /bin/grep "total\":"

	#if [$img = '']
	#then	
	#	img = "failed"
	#fi

	#echo $PR "," $img

done < $INPUT
IFS=$OLDIFS


#ref:
#1) http://www.cyberciti.biz/faq/unix-linux-bash-read-comma-separated-cvsfile/
