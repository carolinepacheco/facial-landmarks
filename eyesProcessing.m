function [V, CONT] = eyesProcessing(imgEye, landcont)

%  This function is to detect the eyes
%  Reference:
%  Silva, Caroline; Schnitman, Leizer ;  Oliveira, Luciano. "Detection of Facial Landmarks
%  Using Local-Based Information". The 19th edition of the Brazilian Conference on Automation - CBA 2012,
%  Campina Grande, PB, Brazil (oral presentation), September 3, 2012. 
%
%  Copyright 2014 by Caroline Pacheco do E.Silva
%  If you have any problem, please feel free to contact Caroline Pacheco do E.Silva.
%  lolyne.pacheco@gmail.com
%%

% adjust the contrast of the image
limites = stretchlim(imgEye);
ajustada = imadjust(imgEye,limites,[]);

% increase the size of the original image
resizeeyes = 9;
linhaeye = floor(length(ajustada(:,1,1))*resizeeyes);
colunaeye =  floor(length(ajustada(1,:,1))*resizeeyes);

% original image adjusted
picEyeImg = imresize(imgEye,[linhaeye,colunaeye],'bilinear');

% eliminating the skin region
cform = makecform('srgb2lab');
J = applycform(picEyeImg,cform);

L=graythresh(J(:,:,2));
BWeye=im2bw(J(:,:,2),L);
M=graythresh(J(:,:,3));
BW2eye=im2bw(J(:,:,3),M);
O=BWeye.*BW2eye;

P=bwlabel(O,8);
BB=regionprops(P,'Boundingbox');
BB1=struct2cell(BB);
BB2=cell2mat(BB1);
[s1 s2]=size(BB2);

mx=0;
for kRight=3:4:s2-1
    p=BB2(1,kRight)*BB2(1,kRight+1);
    if p>mx && (BB2(1,kRight)/BB2(1,kRight+1))<1.8
        mx=p;
    end
end

% selecting the area of interest using blob
complementeye = imcomplement(BW2eye);
ccEye = bwconncomp(complementeye);
statsEye = regionprops(ccEye,'Area');
idxEye = find([statsEye.Area] == max([statsEye.Area]));
estEye = ismember(labelmatrix(ccEye), idxEye);

% dilated image
seEye = strel('line',10,0);
I2Eye = imdilate(estEye,seEye);

% filling holes
BWdfilleye = imfill(I2Eye, 'holes');

cannyEye = edge(BWdfilleye,'canny',0.4);

[V, CONT] = detectLandmarks(cannyEye,resizeeyes,landcont);

end