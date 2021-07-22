Expdirectory = getDirectory("Choose an Export Directory");
Expdir = substring (Expdirectory, 0);
directory = getDirectory("Choose an Import Directory");
list = getFileList(directory);
for (n=0; n<list.length; n=n+1){
open(list[n]);
 imageTitle=getTitle();
 selectWindow(imageTitle);
 run("Image Sequence... ", "format=TIFF save=["+Expdir+imageTitle+"]");
 close();
} 
