echo "Translate all files to a EPSG:4326"

for tiffiles in *.tif
do
	echo “Processing $tiffiles”
	#ogr2ogr -f “ESRI Shapefile” -t_srs EPSG:4326 geo/$shp $shp
	gdal_translate -a_srs EPSG:4326 geo/$tiffiles $tiffiles
done
