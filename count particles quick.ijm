input = 1;  //tell computer number of images you want to go through
for (i=1;i<=input;i++){ //set up a loop to go from image 1 to 'input'
j=IJ.pad(i, 2); //housekeeping - my images are '01' not '1' so i add a zero onto the counter number
open("/Users/paulson/Desktop/Inv Mig/inv/registered_s"+j+".tif"); //open file with things to be measured - rename yours accordingly
run("Subtract Background...", "rolling=10"); //background
setOption("BlackBackground", false);
open("/Users/paulson/Desktop/Inv Mig/inv 05/inv-05_s"+j+"c1.tif"); //open file with things to be masked
setOption("BlackBackground", false); 
run("Make Binary"); //make binary and dilate
run("Dilate");
run("Create Selection"); //this selects all of the objects that have been binarized and dilated
selectWindow("registered_s"+j+".tif"); //select window with things to be measured
run("Restore Selection"); //restore selected objects from mask
run("Fill", "slice"); //don't remember what this does
run("Select None"); //?
selectWindow("inv-05_s"+j+"c1.tif"); //?
close();
setOption("BlackBackground", false); //?
run("Enhance Contrast", "saturated=0.35");
run("Make Binary");
run("Close-");
run("Fill Holes");
run("Watershed");
run("Analyze Particles...", "size=20-Infinity pixel show=Masks display clear include summarize add");
selectWindow("registered_s"+j+".tif");
close();
selectWindow("Mask of registered_s"+j+".tif"); //masked objects
saveAs("Tiff", "/Users/paulson/Desktop/Inv Mig/inv/Mask of registered_s"+j+".tif");
close();
open("/Users/paulson/Desktop/Inv Mig/inv 05/inv-05_s"+j+"c2.tif"); //reopen objects to be measured?
IJ.deleteRows(0, roiManager("count")); //i think this roimanager gets created when you select all objects from first mask
roiManager("Measure"); //measures each object on file to be measured ie mask from blue, measure on green
saveAs("Results", "/Users/paulson/Desktop/Inv Mig/inv 05/Results of inv-05_s"+j+"c2.txt"); //save all measurements
close();
//close();
//open("/Users/paulson/Desktop/new/mig/registered_s"+j+".tif");
//selectWindow("Mask of registered_s"+j+".tif");
//run("Create Selection");
//selectWindow("registered_s01.tif");
//run("Restore Selection");
} //end loop, this will go back to the beginning, add 1 to counter and start process again.