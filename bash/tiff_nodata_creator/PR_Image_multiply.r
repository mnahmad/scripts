args <- commandArgs(TRUE)

library(raster)

#image path
Image_source_path = paste(args[1], args[2] , sep = "/");
#open image
Image_raster = raster(Image_source_path);

# PR path
PR_source_path = paste(args[3], args[4] , sep = "/");
#open image
PR_raster = raster(PR_source_path);

test_img = Image_raster * PR_raster;

# construct target image path string
target_path = paste(args[5], args[6] , sep = "/");

#write image
writeRaster(test_img, target_path , format="GTiff", overwrite=TRUE);

#clear temp folder for R, NOT WORKING
removeTmpFiles(h=1)



