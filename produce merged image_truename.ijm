//Open targeted images in the orignal lif file before running the codes.
directory = getDirectory("Choose an Export Directory");
for (i=0; i<80; i=i+1){
//set the max value based on the number of your images
imageTitle=getTitle();
//replace"/"with targeted string based on the lif file name
startindex=indexOf(imageTitle, "- ")+2;
truename = substring (imageTitle, startindex);
selectWindow(imageTitle);
run("Duplicate...", "title=copy duplicate");
selectWindow("copy");
run("Z Project...", "projection=[Max Intensity] all");
run("Split Channels");
selectWindow("C3-MAX_copy");
close();
run("Merge Channels...", "c1=[C2-MAX_copy] c2=[C1-MAX_copy] create");
saveAs("Tiff", directory+truename+".tif");
close();
close();
close();
} 
