/*
 * Macro template to process multiple images in a folder
 */
setBatchMode(true);
input = getDirectory("Input directory");
output = getDirectory("Output directory");

Dialog.create("File type");
Dialog.addString("File suffix: ", ".tif", 5);
Dialog.show();
suffix = Dialog.getString();

processFolder(input);

function processFolder(input) {
	list = getFileList(input);
	for (i = 0; i < list.length; i++) {
		if(File.isDirectory(input + list[i]))
			processFolder("" + input + list[i]);
		if(endsWith(list[i], suffix))
			processFile(input, output, list[i], i);
	}
}

function processFile(input, output, file, index) {
	// do the processing here by replacing
	// the following two lines by your own code
				open(input+file);
				run("Montage to Stack...", "images_per_row=4 images_per_column=5 border=0");
				run("Image Sequence... ", "format=TIFF name=["+file+"_im] digits=2 save=["+output+"]");
				
				
}
