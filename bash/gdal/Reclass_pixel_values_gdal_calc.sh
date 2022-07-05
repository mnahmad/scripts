#!/bin/bash

# this script shows the usage of gdal_calc scriput, for exmaple filter raster values above 1

gdal_calc.py -A input.tif  --outfile=result11.tif --calc="A*(A>1)" --NoDataValue=0


# --calc="A>100"  if grater than 100 set pixel to 1 otherwise 0
# Any value grater than 0 , set to 1
gdal_calc.py -A 2022_01_01.tif  --outfile=result-grt-1.tif --calc="A>0" --NoDataValue=0
