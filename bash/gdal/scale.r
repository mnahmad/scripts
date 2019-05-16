args <- commandArgs(TRUE)

library(raster)

source_folder_path <- args[1];

Source_resolution_img = paste(source_folder_path, args[2] , sep = "/");

src_res_img = raster(Source_resolution_img);

desired_resolution_img = paste(args[3], args[4] , sep = "/");

desire_res_img = raster(desired_resolution_img);

print("Resampling");
print(Sys.time());

# reproject from 8km to 5km
new_raster <- projectRaster(src_res_img, desire_res_img, packages="raster"); 

target_path = paste(args[5], args[2] , sep = "/");

print("Image writing");
writeRaster(new_raster, filename=target_path, format="GTiff", overwrite=TRUE)


