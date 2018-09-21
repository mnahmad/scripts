#!/bin/bash

# HDF convert, using gdalinfo to list all the layers and then extracting speific layer. 

clear


echo "MODIS NDVI Seperation script"

cd /path/modis


i=1

for myfile in *.hdf
do

	
	stroutput=$(gdalinfo $myfile)

	#echo $stroutput

	echo "------------Extract file Name-----------------"

	patten1=SUBDATASET_1_NAME

	echo "${#stroutput}"

	pos1=$(awk -v a="$stroutput" -v b="$patten1" 'BEGIN{print index(a,b)}')

	#echo ${stroutput:17487:138}

	#echo ${stroutput:$pos1 + 17 :113}	# NOTE: count characters from 'SUBDATASET_1_DESC' till the the end of NDVI, since my path is different thus 138 your will be differnt. 

	filename=${stroutput:$pos1 + 17 :113}	# NOTE: count characters from 'SUBDATASET_1_DESC' till the the end of NDVI, since my path is different thus 138 your will be differnt. 	

	echo $filename
	
	outputfile="modis_NDVI_"$i".tif"		

	gdal_translate -of GTiff "$filename" $outputfile


	i=`expr $i + 1`
done

echo "End of Script"



