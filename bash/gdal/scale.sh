#!/bin/bash

# this script resample GIMMS images using r script. 

clear

# fun stuff
red='\e[0;31m'
Cyan='\e[0;36m'
LightBlue='\e[1;34m'
Orange='\e[0;33m'     
Yellow='\e[1;33m'
NC='\e[0m' # No Color

echo -e "${red}*** Scale changer Start ***${NC}"

cd /tmp/folder/GIMMS-gref-tif/  #NOTE: change path to your own folder

	for myfile in *.tif
	do	
		echo -e "${LightBlue} -- Image name -- ${NC}"$myfile
		echo -e "${LightBlue} -- R part of converter starts -- ${NC}"
		

		# Original Resolution image (in my case 8km)
		src1folder="/tmp/folder/GIMMS-gref-tif"

		# desired resolution image (one file for all, res 5km)
		src2folder="/tmp/folder/GIMMS_scale_tif"
		src2img="source_image.tif"
		 			
		# target folder where new resampled images will be saved 
		target="/tmp/folder/GIMMS_scale_tif"

		
		Rscript scale.r $src1folder $myfile $src2folder $src2img $target
				

		# R temp folder is being filled by temp files, we need to clean it as well.	
		rm /tmp/R_raster_username/*.gri
		rm /tmp/R_raster_username/*.grd

	# end for loop
	done



echo "End of Script"



