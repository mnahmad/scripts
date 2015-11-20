#!/bin/bash

clear

# fun stuff
red='\e[0;31m'
Cyan='\e[0;36m'
LightBlue='\e[1;34m'
Orange='\e[0;33m'     
Yellow='\e[1;33m'
NC='\e[0m' # No Color

echo -e "${red}*** Converter Start ***${NC}"

cd /media/external/muhammad/clipped/MONTHLY_NDVI_Tifs/  #NOTE: change path to your own folder

for my_dir in `ls` #all the year folders in parent folder
do			
	
	echo -e "${red} In folder ${NC}"$my_dir
	cd $my_dir  # lets go into year folder

	i=1

	for myfile in *.tif
	do
		outputfile=$myfile"_Kenya.tif"		

		echo -e "${LightBlue} --tiff file clip starts-- ${NC}"
		# -dsalpha adds alpha band to the output tiff which masks out the area falling outside the cutline. shp is outside the years folder in 	main folder 	
		#gdalwarp -cutline ../kenya.shp -crop_to_cutline -dstalpha NDVI_1981_jan.tif NDVI_1981_jan_Kenya.tif 

		# without alpha band it is much faster
		gdalwarp -cutline ../../kenya.shp -crop_to_cutline  $myfile $outputfile 

		i=`expr $i + 1`
	done

	cd ../  # back to parent folder 

done # folder loop


echo "End of Script"



