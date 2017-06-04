
 ;...................................................................................
  ;; ========== This file will take a georeferenced raster image and non-georeferenced raster image 
  ;And georeferenced the and write to the new location.
  ; ;== =======  @Author : B. Mishra (bhogendra@gmail.com)
  ;== =======  Date   : 08/20/2016
  ;==========  Filename: pro_mod_georeference.pro
  ; CALLING SEQUENCE:
     
   ;---------------------image input directory
   PRO pro_georeference_mod_main
  inputImagePath = 'C:\Users\b.mishra\Dropbox\BG\programming\githab\reprojection_georeference\need_to_gereference\'
  ;Referenced georeferenced file
  reference_files = "C:\Users\b.mishra\Dropbox\BG\programming\githab\reprojection_georeference\reference_georeference\ref_geo_25_06.dat"

   ;---------Output directory
   outPutPath = 'C:\Users\b.mishra\Dropbox\BG\programming\githab\reprojection_georeference\georeferenced\'
   
   inputFileList =  FILE_SEARCH(inputImagePath, "*.tif")
   inputFileArraySize = size(inputFileList)
   
    
      for j =0, inputFileArraySize[1]-1 DO BEGIN

        georeference= func_MOD_georeference(reference_files, inputFileList[j], outPutPath)
  
   
      ENDFOR
 
  print, "End all processing."
    
   
   
   
 END
