function [V CONT] = eyebrowsProcessing(imgEyebrow, landcont)
%  This function is to detect the eyebrows
%  Reference:
%  Silva, Caroline; Schnitman, Leizer ;  Oliveira, Luciano. "Detection of Facial Landmarks
%  Using Local-Based Information". The 19th edition of the Brazilian Conference on Automation - CBA 2012, 
%  Campina Grande, PB, Brazil (oral presentation), September 3, 2012. 
%
%  Copyright 2014 by Caroline Pacheco do E.Silva
%  If you have any problem, please feel free to contact Caroline Pacheco do E.Silva.
%  lolyne.pacheco@gmail.com
%%
%image into grayscale and equalize histogram
grayEyebrow = rgb2gray(imgEyebrow);
histEyebrow= histeq (grayEyebrow);
limEyebrow = stretchlim(histEyebrow);
ajustEyebrow = imadjust(histEyebrow,limEyebrow,[]);
    
% increasing the size of the original image
resizeyebrow  = 8;
linhaEyebrow = floor(length(histEyebrow(:,1,1))*resizeyebrow);
colunaEyebrow =  floor(length(histEyebrow(1,:,1))*resizeyebrow);
picEyebrow= imresize(ajustEyebrow,[linhaEyebrow,colunaEyebrow],'bilinear');
    
% binarized image
BW1Eyebrow = im2bw(picEyebrow,0.46);
    
% binarized image inverting
bw2Eyebrow = imcomplement(BW1Eyebrow);
    
% dilated image
seEyebrow = strel('line',10,0);
I2Eyebrow = imdilate(bw2Eyebrow ,seEyebrow);
    
% preenchendo buracos
BWdfill = imfill(I2Eyebrow, 'holes');
       
% selecting the area of interest using blob
ccEyebrow = bwconncomp(BWdfill);
statsEyebrow = regionprops(ccEyebrow,'Area');
idxEyebrow = find([statsEyebrow.Area] == max([statsEyebrow.Area]));
BW3Eyebrow = ismember(labelmatrix(ccEyebrow), idxEyebrow);

% applying canny
cannyEyebrow = edge(BW3Eyebrow,'canny');
    
[V, CONT] = detectLandmarks(cannyEyebrow,resizeyebrow,landcont);

end