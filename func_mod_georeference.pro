
  
  ;...................................................................................
  ;; ========== This file will take a georeferenced raster image and non-georeferenced raster image 
  ;And georeferenced the and write to the new location.
  ; ;== =======  @Author : B. Mishra (bhogendra@gmail.com)
  ;== =======  Date   : 08/20/2016
  ;==========  Filename: pro_mod_georeference.pro
 
 
 FUNCTION func_mod_georeference , files, inputImage, outputLocation
  COMPILE_OPT IDL2
  ; Start the application
  e = ENVI(/HEADLESS)

  ; Select input georeferenced file
  
  raster = e.OpenRaster(files)
  Metadata = raster.SPATIALREF
  ; Input file need to be georeferenced
  
  raster1 = e.OpenRaster(inputImage)
  newFile = raster1.GetData(BANDS=0)
  length =strlen(raster1.name)-4
  uri_path = outputLocation+STRMID(raster1.name,0, length)+".dat"
  raster2 = ENVIRaster(newFile, URI=uri_path, SPATIALREF=Metadata, NBANDS=1)
  raster2.Save
  print, "finished processing"
  e.Close
end