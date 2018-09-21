#!/bin/bash

# HDF convert, using gdalinfo to list all the layers and then extracting speific layer. 

clear


echo "MODIS NDVI Seperation script"

cd /path/modis


i=1

for myfile in *.hdf
do

	stroutput=$(gdalinfo $myfile)


	echo "------------Extract file Name-----------------"

	patten1=SUBDATASET_1_NAME   # string which will be searched in output of gdalinfo 

	echo "${#stroutput}"

	pos1=$(awk -v a="$stroutput" -v b="$patten1" 'BEGIN{print index(a,b)}')   # search starting positin of pattern in gdalinfo string

	filename=${stroutput:$pos1 + 17 :113}	# NOTE: count characters from 'SUBDATASET_1_DESC' till the the end of NDVI, since my path is different thus 138 your will be differnt. 	

	echo $filename # input file
	
	outputfile="modis_NDVI_"$i".tif"  #generate output file name		
 
	gdal_translate -of GTiff "$filename" $outputfile  #finally extraxt NDVI from *.hdf file and create tiff file


	i=`expr $i + 1`
done

echo "End of Script"



