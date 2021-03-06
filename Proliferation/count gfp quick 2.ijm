input = 96;
for (i=1;i<=input;i++){
j=IJ.pad(i, 2);
open("/Users/paulson/Desktop/new/mig-02/mig-02_s"+j+"c2.tif");
run("Subtract Background...", "rolling=10");
setOption("BlackBackground", false);
open("/Users/paulson/Desktop/new/mig-02/mig-02_s"+j+"c1.tif");
setOption("BlackBackground", false);
run("Make Binary");
run("Dilate");
run("Create Selection");
selectWindow("mig-02_s"+j+"c2.tif");
run("Restore Selection");
run("Fill", "slice");
run("Select None");
selectWindow("mig-02_s"+j+"c1.tif");
close();
setOption("BlackBackground", false);
run("Enhance Contrast", "saturated=0.35");
run("Make Binary");
run("Close-");
run("Fill Holes");
run("Watershed");
run("Analyze Particles...", "size=20-Infinity pixel show=Masks display clear include summarize add");
selectWindow("mig-02_s"+j+"c2.tif");
close();
selectWindow("Mask of mig-02_s"+j+"c2.tif");
saveAs("Tiff", "/Users/paulson/Desktop/new/mig-02/Mask of mig-02_s"+j+"c2.tif");
close();
//close();
//open("/Users/paulson/Desktop/new/mig/registered_s"+j+".tif");
//selectWindow("Mask of registered_s"+j+".tif");
//run("Create Selection");
//selectWindow("registered_s01.tif");
//run("Restore Selection");
}
