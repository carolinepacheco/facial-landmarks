%  An example how to use facial landmarks
%  The below codes are not optimized. It is straightforward for easy understanding.
%  Copyright 2014 by Caroline Pacheco do E.Silva
%  If you have any problem, please feel free to contact Caroline Pacheco do E.Silva.
%  lolyne.pacheco@gmail.com

%  If you have used this code in a scientific publication, we would appreciate citations to
%  the following paper: 2012 - Silva, Caroline; Schnitman, Leizer ; Oliveira, Luciano. "Detection of Facial Landmarks Using Local-Based Information". The 19th edition of the Brazilian Conference on Automation - CBA 2012, 
%  Campina Grande, PB, Brazil (oral presentation), September 3, 2012.

%  You can found more details in: https://www.behance.net/gallery/6389157/Facial-Landmarks-Extraction
%%
%##################################Important Remarks ##################################
%##################################%##################################%################
% This method was setting to work with MUG dataset. If you will use another dataset. 
% Please check if (face, eyes, eyebrows, and mouth) regions are being detected correctly using he your_dataset_setting.m file.
% Maybe, you need to change some parameters (See the file readme)

%% read an input image and detect facial regions (face, eyes, mouth, and eyebrows)

clc; clear;

% read the input image
I = imread('face.jpg');
I = imresize(I, [224,224]);

[imgFace, LeftEye, RightEye, Mouth, LeftEyebrow,  RightEyebrow] = detectFacialRegions(I);
%% landmark detection

% landmark setting to Eyes and Mouth (4 and 5)
landconf = 5;

% landmarks seting Eyebrows (only 2)
landconfEyebrow = 2;

% left eye landmarks 
imgLeftEye = (imgFace(LeftEye(1,2):LeftEye(1,2)+LeftEye(1,4),LeftEye(1,1):LeftEye(1,1)+LeftEye(1,3),:));
[landLeftEye, leftEyeCont] = eyesProcessing(imgLeftEye,landconf);

% right eye landmarks 
imgRightEye = (imgFace(RightEye(1,2):RightEye(1,2)+RightEye(1,4),RightEye(1,1):RightEye(1,1)+RightEye(1,3),:));
[landRightEye, rightEyeCont] = eyesProcessing(imgRightEye,landconf);

% mouth landmarks 
imgMouth = (imgFace(Mouth(1,2):Mouth(1,2)+Mouth(1,4),Mouth(1,1):Mouth(1,1)+Mouth(1,3),:));
[landMouth, MouthCont] = mouthProcessing(imgMouth,landconf);

% left eyebrow landmarks 
imgLeftEyebrow = (imgFace(LeftEyebrow(1,2):LeftEyebrow(1,2)+LeftEyebrow(1,4),LeftEyebrow(1,1):LeftEyebrow(1,1)+LeftEyebrow(1,3),:));
[landLeftEyebrow, leftEyebrowCont] = eyebrowsProcessing(imgLeftEyebrow,landconfEyebrow);

% right eyebrow landmarks 
imgRightEyebrow = (imgFace(RightEyebrow(1,2):RightEyebrow(1,2)+RightEyebrow(1,4),RightEyebrow(1,1):RightEyebrow(1,1)+RightEyebrow(1,3),:));
[landRightEyebrow, RightEyebrowCont] = eyebrowsProcessing(imgRightEyebrow,landconfEyebrow);

%% shows (eyes, mouth and eyebrows)

imshow(imgFace,'InitialMagnification',50); hold on;
showsLandmarks(landLeftEye,leftEyeCont,LeftEye,landconf);
showsLandmarks(landRightEye,rightEyeCont,RightEye,landconf);
showsLandmarks(landMouth,MouthCont,Mouth,landconf);
showsLandmarks(landLeftEyebrow,leftEyebrowCont,LeftEyebrow,landconfEyebrow);
showsLandmarks(landRightEyebrow,RightEyebrowCont,RightEyebrow,landconfEyebrow);

%% returns the coordinates of the landmarks (eyes, mouth and eyebrows)
coordLeftEye = landmarks(landLeftEye,leftEyeCont,LeftEye,landconf);
coordRightEye = landmarks(landRightEye,rightEyeCont,RightEye,landconf);
coordMouth = landmarks(landMouth,MouthCont,Mouth,landconf);
coordLeftEyebrow = landmarks(landLeftEyebrow,leftEyebrowCont,LeftEyebrow,landconfEyebrow);
coordRightEyebrow = landmarks(landRightEyebrow,RightEyebrowCont,RightEyebrow,landconfEyebrow);