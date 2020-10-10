#!/bin/bash



cd /path/shape_files/

file="/path/all.shp"  #output shape file name

for i in $(ls *.shp)
do

      if [ -f "$file" ]  # if file name is same as output file then append and update (only for first time)
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
