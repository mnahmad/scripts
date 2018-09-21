#!/bin/bash

cd /path/shape_files/

file="/path/all.shp"

for i in $(ls *.shp)
do

      if [ -f "$file" ]
      then
           echo "creating final merge.shp" 
	   echo $i		
           
           #ogr2ogr -f "ESRI Shapefile" -update -append $file $i -nln merge
	   
           ogr2ogr -f "ESRI Shapefile" -update -append $file $i	
	   
	   #ogr2ogr -update -append $file $i -nln merge	

      else
           echo "merging……"
      ogr2ogr -f 'Custom message : ESRI Shapefile' $file $i
fi
done


#reference = http://www.northrivergeographic.com/ogr2ogr-merge-shapefiles
