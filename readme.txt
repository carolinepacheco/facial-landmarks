% The experiments were performed with the MUG Facial Expression Database. 
% If you need to use this algorithm with other databases,  you may need to
% change some parameters: 
% *******************************************************************************
%  
% files                        parameters
% detectFacialRegions.m        Eye(1,:), Eye(2,:),         
%                              LeftEyebrow(4),LeftEyebrow(3),            
%                              RightEyebrow(4), RightEyebrow(3)
% 
% eyesProcessing.m             resizeeyes
% mouthProcessing.m            resizemouth
% eyebrowsProcessing.m         resizeyebrow
% 
% Warning:
% 
% In the Test.m file, the parameter landconf is set to 4 or 5 (Eyes and Mouth landmarks). 
% The parameter landconfEyebrow is set to 2 (Eyebrow landmarks)