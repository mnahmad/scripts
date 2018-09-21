#!/bin/bash

# This script convert hdf files to tif files. Hdf files contains many layers, thus, used gdalingo to get specific layer to be extracted. 

clear

# fun stuff
red='\e[0;31m'
Cyan='\e[0;36m'
LightBlue='\e[1;34m'
Orange='\e[0;33m'     
Yellow='\e[1;33m'
NC='\e[0m' # No Color

echo -e "${red}*** Converter Start ***${NC}"

cd /path/MONTHLY/  #NOTE: change path to your own folder

for my_dir in `ls` #all the year folders in parent folder
do			
	
	echo -e "${red} In folder ${NC}"$my_dir
	cd $my_dir  # lets go into year folder

	i=1

	for myfile in *.hdf
	do

		stroutput=$(gdalinfo $myfile)
	
		#echo $stroutput
	
		echo -e "${Orange} Extract file Name${NC}"
	
		patten1=SUBDATASET_2_NAME   # Search string to goto line for file name extracttion
	
		#echo "${#stroutput}"
	
		pos1=$(awk -v a="$stroutput" -v b="$patten1" 'BEGIN{print index(a,b)}')
	
		#SUBDATASET_2_NAME=HDF4_SDS:UNKNOWN:"VIP30P4.A1981001.003.hdf":1  --- toltal 63 character including 18 i.e.'SUBDATASET_2_NAME'
		
		filename=${stroutput:$pos1 + 17 :45}	# NOTE: count characters from 'SUBDATASET_2_NAME=' till the the end (:1)  total 63 -18 = 45	
	
		#echo $filename
		echo -e "${Yellow}" $filename "${NC}"
		outputfile=$filename"_new.tif"		
		#echo -e "${LightBlue}" $outputfile "${NC}"

		echo -e "${LightBlue} --tiff file generation-- ${NC}"
		#gdal_translate -of GTiff $filename $outputfile
		# Tif gen + georef		
		#gdal_translate -of GTiff -a_ullr ullat ullon lrlat lelon -a_srs EPSG:4269 $filename $outputfile
		gdal_translate -of GTiff -a_ullr -180 90 180 -90 -a_srs EPSG:4326 $filename $outputfile

		i=`expr $i + 1`
	done

	cd ../  # back to parent folder 

done # folder loop


echo "End of Script"



