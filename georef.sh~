#!/bin/bash

clear

# fun stuff
red='\e[0;31m'
Cyan='\e[0;36m'
LightBlue='\e[1;34m'
Orange='\e[0;33m'     
Yellow='\e[1;33m'
NC='\e[0m' # No Color

echo -e "${red}*** Geo Ref Start ***${NC}"

cd /tmp/folder/GIMMS_scale_tif_v3/ # for GIMMS 
                            
	for myfile in *.tif
	do
		# my files name is like geo00jul15a.tif, I  stripped '.tif' and added 'resampled.tif'	
		output_newfile=${myfile:0:11}		
		output_newfile=$output_newfile"_resampled.tif"

		# re project it as well.
		gdalwarp -tr 0.050000000000000 -0.050000000000000  $myfile $output_newfile

	done

	cd ../  # back to parent folder 

echo -e "${red}*** Geo Ref ends ***${NC}"




