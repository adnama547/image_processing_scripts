//setBatchMode(true);
input = 12;  //tell computer number of images you want to go through
sequence=newArray("E", "F", "G", "H");
for (j=0; j<sequence.length; j++){
	for (i=1;i<=input;i++){ //set up a loop to go from image 1 to 'input'
		let=sequence[j];
		print(let);
		ind=IJ.pad(i, 2);
		print(ind);
		run("Image Sequence...", "open=[/Volumes/Amanda4TB/AKP_96_well_20180124_livedead_stain_1/AT Staining] file="+let+"_"+ind+" sort");
		run("Deinterleave", "how=5");
		run("Merge Channels...", "c2=[AT Staining #1] c4=[AT Staining #4] c5=[AT Staining #5] c6=[AT Staining #2] c7=[AT Staining #3] create");
		selectWindow("Composite");
		run("Make Montage...", "columns=4 rows=2 scale=1");
		saveAs("Tiff", "/Volumes/Amanda4TB/AKP_96_well_20180124_livedead_stain_1/AT Staining/"+let+"_"+ind+"_composite_montage.tif");
		close();
		selectWindow("Composite");
		close();	
	}
}



