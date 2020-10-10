#!/bin/bash

# this script shows the usage of gdal_calc scriput, for exmaple filter raster values above 1 

gdal_calc.py -A input.tif  --outfile=result11.tif --calc="A*(A>1)" --NoDataValue=0
