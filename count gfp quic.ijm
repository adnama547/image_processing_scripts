input = 96;
for (i=1;i<=input;i++){
j=IJ.pad(i, 2);
open("/Users/paulson/Desktop/new/mig/mig_s"+j+".tif");
//run("Threshold...");
// Color Thresholder 2.0.0-rc-26/1.49p
// Autogenerated macro, single images only!
min=newArray(3);
max=newArray(3);
filter=newArray(3);
a=getTitle();
run("HSB Stack");
run("Convert Stack to Images");
selectWindow("Hue");
rename("0");
selectWindow("Saturation");
rename("1");
selectWindow("Brightness");
rename("2");
min[0]=0;
max[0]=255;
filter[0]="pass";
min[1]=0;
max[1]=255;
filter[1]="pass";
min[2]=20;
max[2]=255;
filter[2]="pass";
for (i=0;i<3;i++){
  selectWindow(""+i);
  setThreshold(min[i], max[i]);
  run("Convert to Mask");
  if (filter[i]=="stop")  run("Invert");
}
imageCalculator("AND create", "0","1");
imageCalculator("AND create", "Result of 0","2");
for (i=0;i<3;i++){
  selectWindow(""+i);
  close();
}
selectWindow("Result of 0");
close();
selectWindow("Result of Result of 0");
rename(a);
// Colour Thresholding-------------

run("Make Binary");
run("Dilate");
run("Watershed");
run("Make Binary");
run("Analyze Particles...", "size=26-Infinity pixel show=Masks display exclude clear summarize add");
selectWindow("mig_s"+j+".tif");
close();
selectWindow("Mask of mig_s"+j+".tif");
saveAs("Tiff", "/Users/paulson/Desktop/new/mig/Mask of mig_s"+j+".tif");
close();
}