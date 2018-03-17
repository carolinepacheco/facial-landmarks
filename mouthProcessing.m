function [V, CONT] = mouthProcessing(imgMouth, landcont)
%  This function is to detect the mouth
%  Reference:
%  Silva, Caroline; Schnitman, Leizer ;  Oliveira, Luciano. "Detection of Facial Landmarks
%  Using Local-Based Information". The 19th edition of the Brazilian Conference on Automation - CBA 2012, 
%  Campina Grande, PB, Brazil (oral presentation), September 3, 2012. 
%
%  Copyright 2014 by Caroline Pacheco do E.Silva
%  If you have any problem, please feel free to contact Caroline Pacheco do E.Silva.
%  lolyne.pacheco@gmail.com
%%

% applying Gaussian filter
filtroGaussian= fspecial('gaussian',[5 5],2);
Ig = imfilter(imgMouth,filtroGaussian,'same');
    
% resizing the image
resizemouth = 3;
linhas = floor(length(Ig(:,1,1))*resizemouth);
colunas =  floor(length(Ig(1,:,1))*resizemouth);
pic = imresize(Ig,[linhas,colunas],'bilinear');

% separating the image components (HSV)
hsv = rgb2hsv(pic); 
[h,s,v] = rgb2hsv(pic);
   
% Erode Hue
se = strel('disk',5);  
erodedHue = imerode(h,se);
    
% Dilate Hue
se = strel('disk',8);
dilatedErodedHue = imdilate(erodedHue,se);

% convert image to binary
bw = im2bw(dilatedErodedHue,graythresh(dilatedErodedHue));
    
% finding and selecting blob
cc = bwconncomp(bw);
stats = regionprops(cc,'Area');
idx = find([stats.Area] == max([stats.Area]));
BW6 = ismember(labelmatrix(cc), idx);
   
cannyMouth = edge(BW6,'canny',0.4);
 
[V CONT] = detectLandmarks(cannyMouth, resizemouth,landcont);

end