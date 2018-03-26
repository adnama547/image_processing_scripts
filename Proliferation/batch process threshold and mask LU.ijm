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
			processFile(input, output, list[i]);
	}
}

function processFile(input, output, file) {
	// do the processing here by replacing
	// the following two lines by your own code
				open(input+file);
				run("8-bit");
				run("Subtract Background...", "rolling=12");
				run("Subtract Background...", "rolling=50");
				run("Subtract Background...", "rolling=50");
				run("Enhance Contrast...", "saturated=0.4");
				contrasted=getTitle;
				//print("contrasted="+contrasted);
				run("Duplicate...", " ");
				setThreshold(8, 255);
				run("Make Binary", "thresholded remaining");
				run("Despeckle");
				run("Watershed");
				watersheded=getTitle;
				//print("watersheded = "+watersheded);
				run("Analyze Particles...", "size=50-Infinity pixel show=Outlines exclude summarize");
				run("MaskLUT");
				drawing=getTitle;
				//print("drawing="+drawing);
				selectImage(contrasted);
				//print(drawing);
				run("Add Image...", "image=["+drawing+"] x=0 y=0 opacity=100 zero");
				overlaid=getTitle;
				//print("overlaid="+overlaid);
				saveAs("Jpeg", output + overlaid);
				//run("Close");
//run("Close");
//run("Close");
}
