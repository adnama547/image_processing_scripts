input=94;
for (i=3;i<=input;i++)
{
j=IJ.pad(i, 2);
open("/Volumes/Data/Amanda/Gartner Lab 2015/Invasion and Migration Assays/20150323 inv mig/migration 01/migration 01_s"+j+".tif");
open("/Volumes/Data/Amanda/Gartner Lab 2015/Invasion and Migration Assays/20150323 inv mig/migration 02/migration 02_s"+j+"c2.tif");
open("/Volumes/Data/Amanda/Gartner Lab 2015/Invasion and Migration Assays/20150323 inv mig/migration 02/migration 02_s"+j+"c3.tif");
open("/Volumes/Data/Amanda/Gartner Lab 2015/Invasion and Migration Assays/20150323 inv mig/migration 02/migration 02_s"+j+"c1.tif");
run("Images to Stack", "name=stack"+j+" title=[] use");
run("Save", "save=[/Volumes/Data/Amanda/Gartner Lab 2015/Invasion and Migration Assays/20150323 inv mig/stack"+j+".tif]");
close();
}
