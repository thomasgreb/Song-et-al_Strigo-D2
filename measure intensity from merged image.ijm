directory = getDirectory("Choose an Import Directory");
list = getFileList(directory);
for (i=0; i<list.length; i=i+1){
open(list[i]);
imageTitle=getTitle();
print(imageTitle);
rename("Composite");
run("Z Project...", "projection=[Max Intensity]");
selectWindow("MAX_Composite");
setThreshold(50, 255);//range could be changed based on cell type or tissues
setOption("BlackBackground", true);
run("Convert to Mask");
selectWindow("MAX_Composite");
run("Watershed");
selectWindow("Composite");
run("Split Channels");
selectWindow("C1-Composite");
run("Duplicate...", "title=mcr");
selectWindow("C1-Composite");
close();
selectWindow("C2-Composite");
run("Duplicate...", "title=yfp");
selectWindow("C2-Composite");
close();
selectWindow("MAX_Composite");
run("Set Measurements...", "area mean min limit display redirect=mcr decimal=3");
run("Analyze Particles...", "size=5-Infinity pixel circularity=0.40-1.00 show=Outlines display include record");
//circularity may change depending on the cell type
selectWindow("MAX_Composite");
run("Set Measurements...", "area mean min limit display redirect=yfp decimal=3");
run("Analyze Particles...", "size=5-Infinity pixel circularity=0.40-1.00 show=Outlines display include record");
saveAs("Results", directory+imageTitle+".csv"); 
waitForUser("Pause", "check and close!");
run("Close All");
};
