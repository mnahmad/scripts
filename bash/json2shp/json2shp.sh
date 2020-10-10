#!/bin/bash

# this script will generate Shape files from JASON in a given folder by using ogr2ogr utility. 

clear

# fun stuff
red='\e[0;31m'
Cyan='\e[0;36m'
LightBlue='\e[1;34m'
Orange='\e[0;33m'
Yellow='\e[1;33m'
NC='\e[0m' # No Color

echo -e "${red}*** JSON 2 Shp converter starts ***${NC}"

cd /path/data/  #NOTE: change path to your own folder


	for myfile in *.json
	do

		echo -e "${LightBlue} -- JSON read -- ${NC}"

		# create shape file name from json file name (by removing the last 4 charasters i.e. json)
		shp_filename=${myfile::-4}
		shp_filename="/path/shape_files/"$shp_filename"shp"

		echo $shp_filename

		# using gdal ogr2ogr
		ogr2ogr -nlt POLYGON -skipfailures $shp_filename $myfile

		echo -e "${Yellow} -- Conversion complete -- ${NC}"

	done

echo "End of Script"
