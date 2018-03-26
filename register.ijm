input = 96;
for (i=1;i<=input;i++){
j=IJ.pad(i, 2);
open("/Users/paulson/Desktop/Inv Mig/inv 05/inv-05_s"+j+"c1.tif");
open("/Users/paulson/Desktop/Inv Mig/inv/inv_s"+j+".tif");
run("Images to Stack", "name=Stack title=[] use");
run("Register ROI");
run("Close");
run("Close");
run("Stack to Images");
selectImage("Registered-0002");
saveAs("Tiff", "/Users/paulson/Desktop/Inv Mig/inv/registered_s"+j+".tif");
close();
close();
close();
}