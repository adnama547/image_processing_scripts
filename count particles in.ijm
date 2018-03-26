input = 96;
for (i=1;i<=input;i++){
j=IJ.pad(i, 2);
open("/Users/paulson/Desktop/Inv Mig/inv/registered_s"+j+".tif");
run("8-bit");
//run("Brightness/Contrast...");
setMinAndMax(0, 50);
run("Subtract Background...", "rolling=10");
setAutoThreshold("Default dark");
//run("Threshold...");
setThreshold(20, 255);
run("Analyze Particles...", "size=20-Infinity show=Masks display clear include summarize add");
selectWindow("registered_s"+j+".tif");
close();
selectWindow("Mask of registered_s"+j+".tif");
saveAs("Tiff", "/Users/paulson/Desktop/Inv Mig/inv/Mask of registered_s"+j+".tif");
close();
open("/Users/paulson/Desktop/Inv Mig/inv 05/inv-05_s"+j+"c2.tif");
IJ.deleteRows(0, roiManager("count"));
roiManager("Measure");
saveAs("Results", "/Users/paulson/Desktop/Inv Mig/inv 05/Results of inv-05_s"+j+"c2.txt");
close();
//close();
//open("/Users/paulson/Desktop/new/mig/registered_s"+j+".tif");
//selectWindow("Mask of registered_s"+j+".tif");
//run("Create Selection");
//selectWindow("registered_s01.tif");
//run("Restore Selection");
}