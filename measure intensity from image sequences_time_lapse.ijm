directory = getDirectory("Choose an Import Directory");
list = getFileList(directory);
timepoints=list.length/2; 
for (i=0; i<timepoints; i=i+1){
print(list[2*i+1]);
open(list[2*i]);
rename("copy_mcr");
open(list[2*i+1]);
rename("copy_yfp");
run("Merge Channels...", "c1=copy_mcr c2=copy_yfp create");
run("Z Project...", "projection=[Max Intensity]");
selectWindow("Composite");
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
run("Analyze Particles...", "size=20-Infinity pixel circularity=0.40-1.00 show=Outlines display include record");
selectWindow("MAX_Composite");
run("Set Measurements...", "area mean min limit display redirect=yfp decimal=3");
run("Analyze Particles...", "size=20-Infinity pixel circularity=0.40-1.00 show=Outlines display include record");
waitForUser("Pause", "Check or save result");
run("Close All"); 
} 
updateResults() 


