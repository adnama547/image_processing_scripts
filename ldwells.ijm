input=8;
count=24;
for (i=4;i<=input;i++){
	if(i==6){
		count=30;
	}else{
	j=IJ.pad(count, 2);
	open("/Users/paulson/Desktop/Clone data/at8 well "+i+" ld-OME TIFF-Export-"+j+".ome.tiff");
	selectWindow("at8 well "+i+" ld-OME TIFF-Export-"+j+".ome.tiff - C=2");
	saveAs("Tiff", "/Users/paulson/Desktop/Clone data/AT8W"+i+"LD 568.tif");
	selectWindow("at8 well "+i+" ld-OME TIFF-Export-"+j+".ome.tiff - C=1");
	run("Save", "save=[/Users/paulson/Desktop/Clone data/AT8W"+i+"LD 647.tif]");
	selectWindow("at8 well "+i+" ld-OME TIFF-Export-"+j+".ome.tiff - C=0");
	run("Save", "save=[/Users/paulson/Desktop/Clone data/AT8W"+i+"LD 480.tif]");
	setMinAndMax(1093, 65026);
	selectWindow("AT8W"+i+"LD 480.tif");
	setMinAndMax(324, 65265);
	selectWindow("AT8W"+i+"LD 568.tif");
	setMinAndMax(259, 65240);
	run("Merge Channels...", "c2=[AT8W"+i+"LD 480.tif] c6=[AT8W"+i+"LD 568.tif] c7=[AT8W"+i+"LD 647.tif] create");
	run("Save", "save=[/Users/paulson/Desktop/Clone data/AT8W"+i+"LD 3CP.tif]");
	saveAs("Jpeg", "/Users/paulson/Desktop/Clone data/AT8W"+i+"LD 3CP.jpg");
	selectWindow("AT8W"+i+"LD 3CP.tif");
	close();
	count=count+2;
}
}