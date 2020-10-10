#!/bin/bash

#--------------------------------------------------------------------------------------------------------
# This Script will remove characters (", _, __ and .) from file names in directory within parent directory. 
#
# Directory structure
# Parent_folder 
#	1981
#	1982
#	....
#	2012
#--------------------------------------------------------------------------------------------------------

clear

# fun stuff
red='\e[0;31m'
Cyan='\e[0;36m'
LightBlue='\e[1;34m'
Orange='\e[0;33m'     
Yellow='\e[1;33m'
NC='\e[0m' # No Color

echo -e "${red}*** Renaming Start ***${NC}"

#cd /media/external/muhammad/clipped/MONTHLY_NDVI_Tifs/  #NOTE: change path to your own folder
#cd /home/geoinformatics/myscripts/PR/MONTHLY_PR_tifs/
cd /media/D6742B23742B05B9/Marshall/renametests/

for my_dir in ls #all the year folders in parent folder
do			
	cd $my_dir  # lets go into year folder
	echo -e "${red} In folder ${NC}"$my_dir

	# rename file to remove " charachters
	rename  's/\"//' *.tif
	rename  's/\"//' *.tif

	rename  's/\_/-/' *.tif
	rename  's/\__/-/' *.tif

	# this will remove . , even from extension
	rename  's/\./-/' *.tif
	rename  's/\./-/' *.tif



	
#----- if .tif is changed to -tif then used this part, other wise no need.-----------------------------------
	#bring back the extension dot
	# cut last four character of a file and put file name in str_filename
	# now str_filename = str_filename + ".tif" and apply ren command	
	#ren 

#	for myfile in `ls`
#	do
				
#		fname=${myfile:49:54}		
		
#		echo $fname
		#ren 
#	done
#-------------------------------------------------------------------------------------------------------------

	cd ../  # back to parent folder 

done # folder loop


echo "End of Script"



