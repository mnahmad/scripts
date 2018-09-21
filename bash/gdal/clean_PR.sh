#!/bin/bash

# this script is shows the usage of gdal_calc scriput 

gdal_calc.py -A input.tif  --outfile=result11.tif --calc="A*(A>1)" --NoDataValue=0
