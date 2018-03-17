% This method was setting to work with MUG dataset. If you will use another dataset, 
% please check if (face, eyes, eyebrows, and mouth)regions are being
% detected correctly using the code below.

%% Input Image
  I = imread('face.jpg'); % read an image of your dataset
  I = imresize(I, [224,224]);
  imshow(I)

%% Face Detect
  FDetect = vision.CascadeObjectDetector;
  Face = step(FDetect,I);
  imgFace = (I(Face(1,2):Face(1,2)+Face(1,4),Face(1,1):Face(1,1)+Face(1,3),:));
  imshow(imgFace)
  
%% Left Eye Detect
  EyeDetect = vision.CascadeObjectDetector('LeftEye');
  Eye=step(EyeDetect,imgFace);
  LeftEye  = Eye(1,:);
  imgLeftEye = (imgFace(LeftEye(1,2):LeftEye(1,2)+LeftEye(1,4),LeftEye(1,1):LeftEye(1,1)+LeftEye(1,3),:));
  imshow(imgLeftEye)
  
%%  Right Detect
  EyeDetect = vision.CascadeObjectDetector('RightEye');
  Eye=step(EyeDetect,imgFace);
  RightEye = Eye(2,:);
  imgRightEye = (imgFace(RightEye(1,2):RightEye(1,2)+RightEye(1,4),RightEye(1,1):RightEye(1,1)+RightEye(1,3),:));
  imshow(imgRightEye)
   
%% Mouth Detect
  MouthDetect = vision.CascadeObjectDetector('haarcascade/haarcascade_smile.xml');
  findMouth=step(MouthDetect,imgFace);
  orderMouth= sortrows(findMouth,2);
  posMouth = size(findMouth,1);
  Mouth = orderMouth(posMouth,:);
  imgMouth = (imgFace(Mouth(1,2):Mouth(1,2)+Mouth(1,4),Mouth(1,1):Mouth(1,1)+Mouth(1,3),:));
  imshow(imgMouth)

%% Left Eyebrow Detect
  LeftEyebrow   = LeftEye;
  LeftEyebrow(4) = (LeftEyebrow(4)/2)-4;
  LeftEyebrow(3) = LeftEyebrow(3);
  LeftEyebrow(4) = uint8(LeftEyebrow(4));
  LeftEyebrow(3) = uint8(LeftEyebrow(3));
  imgLeftEyebrow = (imgFace(LeftEyebrow(1,2):LeftEyebrow(1,2)+LeftEyebrow(1,4),LeftEyebrow(1,1):LeftEyebrow(1,1)+LeftEyebrow(1,3),:));
  imshow(imgLeftEyebrow)
  
%% Right Eyebrow Detect
  RightEyebrow  = RightEye;
  RightEyebrow(4) =  (RightEyebrow(4)/2);
  RightEyebrow(3) = RightEyebrow(3);
  RightEyebrow(4) = uint8(RightEyebrow(4));
  RightEyebrow(3) = uint8(RightEyebrow(3));
  imgRightEyebrow = (imgFace(RightEyebrow(1,2):RightEyebrow(1,2)+RightEyebrow(1,4),RightEyebrow(1,1):RightEyebrow(1,1)+RightEyebrow(1,3),:));
  imshow(imgRightEyebrow)