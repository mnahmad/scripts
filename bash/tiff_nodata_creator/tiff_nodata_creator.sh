#!/bin/bash

# this script will set nodata for cloud pixels in NDVI (and EVI) dataset using PR band and calling r script. 

clear

# fun stuff
red='\e[0;31m'
Cyan='\e[0;36m'
LightBlue='\e[1;34m'
Orange='\e[0;33m'
Yellow='\e[1;33m'
NC='\e[0m' # No Color

echo -e "${red}*** Hole creator Start ***${NC}"

cd /path/15DAYS_NDVI_tifs/  #NOTE: change path to your own folder

for my_dir in `ls` #all the year folders in parent folder
do

	echo -e "${red} In folder ${NC}"$my_dir
	cd $my_dir  # lets go into year folder

	i=1

	for myfile in *.tif
	do

		echo -e "${LightBlue} -- R part of converter starts -- ${NC}"

		srcfolder1="/path/15DAYS_NDVI_tifs/${my_dir}"

		srcfolder2="/path/15DAYS_PR_tifs/${my_dir}"

		# create PR file name from Image file name
		PR_filename=${myfile:0:33}
		PR_filename=$PR_filename"-003-hdf-3-PR.tif"

		#echo $PR_filename

		targetfolder="/path/processed-4/${my_dir}"


		Rscript /path/sh/PR_Image_multiply.r $srcfolder1 $myfile $srcfolder2 $PR_filename $targetfolder $myfile


		# R temp folder is being filled by temp files, we need to clean it as well.
		rm /tmp/R_raster_geoscilab/*.gri
		rm /tmp/R_raster_geoscilab/*.grd



		i=`expr $i + 1`
	done
	cd ../  # back to parent folder

done # folder loop


echo "End of Script"
