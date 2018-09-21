#!/bin/bash

#gal_warp image to georeference all images in a folder to a specific bbox

echo "Translate all files to a EPSG:4326"

cd /path-to-file/


for tiffiles in *.tif
do
	echo “Processing $tiffiles”
	
	output="/path-to-file/"$tiffiles

	gdal_translate -of GTiff -a_ullr -180.0000000 50.0000000 180.0000000 -50.0000000    -a_srs EPSG:4326  $tiffiles $output	
done
