//numberplates=3;
//numbertimes=8;
//numberposis=49;
//numberchannels=3;
setBatchMode(true);
numberSlices=68;
numbertimes=8;
numberscene=20;
numberchannels=2;
//pArr=newArray('A1', 'A2', 'A3', 'A4', 'A5', 'A6','A7','A8','A9','A10','A11','A12','B1', 'B2', 'B3', 'B4', 'B5', 'B6','B7','B8','B9','B10','B11','B12','C1', 'C2', 'C3', 'C4', 'C5', 'C6','C7','C8','C9','C10','C11','C12','D1', 'D2', 'D3','E1','E2','E3','F1','F2','F3');
pArr=newArray('A1', 'A2', 'A3', 'A4', 'A5', 'A6','A7','A10','A12','B1', 'B2', 'B3', 'B4', 'B5', 'B6','B7','B10','B12','C1', 'C2', 'C3', 'C4', 'C5', 'C6','C7','C10','C12','D1', 'D2', 'D3','E1','E2','E3','F1','F2','F3');



for (j=2;j<=numbertimes;j++){
	for (o=2;o<=numberchannels;o++){
		for (k=1;k<=numberscene;k++){
			for (i=1;i<=numberSlices;i++){
				if (o==1){channel='GFP';}
				else {channel='RFP';}
				t=j-1;
				ii=IJ.pad(i,2);
				qq=IJ.pad(k, 2);
				//print("/Volumes/AMANDA/cd49 proliferation/20160614 cd49f sort proliferation exp 1/TP5_TIFFS/TP"+j+"/"+channel+"/Proliferation MCF10AT sorted by CD49f tp4 and 5-Scene-"+qq+"-"+pArr[k-1]+"-"+pArr[k-1]+"_t"+t+"c"+o+"m"+ii+".tif");
				print("/Volumes/AMANDA/cd49 proliferation/20160614 cd49f sort proliferation exp 1/TP"+j+"_TIFFS/"+channel+"/Proliferation MCF10AT sorted by CD49f tp"+j+"-Scene-"+qq+"-"+pArr[k-1]+"-"+pArr[k-1]+"_t1c"+o+"m"+ii+".tif");
				 open("/Volumes/AMANDA/cd49 proliferation/20160614 cd49f sort proliferation exp 1/TP"+j+"_TIFFS/"+channel+"/Proliferation MCF10AT sorted by CD49f tp"+j+"-Scene-"+qq+"-"+pArr[k-1]+"-"+pArr[k-1]+"_t1c"+o+"m"+ii+".tif");
				montimg=getTitle;
				selectImage(montimg);
				run("Duplicate...", " ");
				run("8-bit"); 
				run("Invert"); 
				//run("Brightness/Contrast..."); 
				run("Enhance Contrast", "saturated=0.35"); 
				setAutoThreshold("Triangle"); 
				//run("Threshold..."); 
				cntrstd=getTitle;
				run("Analyze Particles...", "size=15-infinity pixel circularity=0.50-1.00 show=Outlines summarize");
				//run("Magenta");
				//print("magenta");
				//run("Invert LUT")
				//print("inverted");
				selectWindow(montimg);
				//print("selected");
				run("Add Image...", "image=[Drawing of "+cntrstd+"] x=0 y=0 opacity=35");
				
				//print ("added");
				saveAs("Jpeg", "/Volumes/AMANDA/cd49 proliferation/20160614 cd49f sort proliferation exp 1/output/T"+j+"_"+channel+"_S"+k+"_M"+i+"_OverlayMontage.jpg");
				//print ("saved");
				close();
				close();
				close();
				//selectWindow("Results");
				 //saveAs("Results",  "/Users/paulson/Desktop/prolif/Processed/P"+i+"_T"+j+"_S"+k+"_C"+o+"_Data.csv");
				  // if (isOpen("Results")) { 
				    //   selectWindow("Results"); 
				      // run("Close"); 
				   //} 
			};
		};
	};
};
saveAs("Summary",  "/Volumes/AMANDA/cd49 proliferation/20160614 cd49f sort proliferation exp 1/output/P"+i+"_T"+j+"_S"+k+"_C"+o+"_Data.csv");
