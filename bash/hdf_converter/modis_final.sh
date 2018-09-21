#!/bin/bash

# HDF convert, using gdalinfo to list all the layers and then extracting speific layer. 

clear


echo "MODIS NDVI Seperation script"

cd /path/modis  #NOTE: change path


i=1

for myfile in *.hdf
do

	stroutput=$(gdalinfo $myfile)

	#echo $stroutput

	echo "------------Extract file Name-----------------"

	patten1=SUBDATASET_1_NAME

	echo "${#stroutput}"

	pos1=$(awk -v a="$stroutput" -v b="$patten1" 'BEGIN{print index(a,b)}')

	#SUBDATASET_1_NAME=HDF4_EOS:EOS_GRID:"MOD13Q1.A2013049.h00v08.005.2013067191053.hdf":MODIS_Grid_16DAY_250m_500m_VI:250m 16 days NDVI
	
	filename=${stroutput:$pos1 + 17 :113}	# NOTE: count characters from 'SUBDATASET_1_NAME' till the the end of NDVI, since my path is different thus 113 your will be differnt. 	

	echo $filename
	
	#outputfile="modis_NDVI_"$i".tif"		

	echo "------------tiff file generation-----------------"
	#gdal_translate -of GTiff "$filename" $outputfile

	i=`expr $i + 1`
done

echo "End of Script"



