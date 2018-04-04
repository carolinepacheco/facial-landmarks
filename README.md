# Detection of Facial Landmarks Using Local-Based Information

Last Page Update: **03/04/2018**


This work proposes a method for the detection of 19 facial points of interest (landmarks). Most methods available in the art for detecting facial points fall into two main categories: global and local. Global methods are usually able to detect various landmarks simultaneously with robustness while local landmarks can often detect more quickly. The method presented is based on local information and is composed of several stages of processing to the detection of landmarks that describe eyes, eyebrows and mouth. The experimental results demonstrate that the proposed method compared to the results showed technical ASM compatible. 


Method Overview
---------------------------------------------------
<p align="center"><img src="https://raw.githubusercontent.com/carolinepacheco/FacialLandmarks/master/docs/overview.png" border="0" /></p>
<p align="center"> (a) Original face (b) Detection of the face by the Viola-Jones method (c) Detection of regions of interest. </p>


Face and Facial Regions Detection
---------------------------------------------------
Firstly, the face detection is performed with the traditional Viola–Jones object detection framework. The Viola-Jones framework consists of Haar-like features extraction method and Adaboost classifier. After face detection, the same Viola-Jones framework is used to detect the facial regions (e.g. eyes, mouth, ...). The eyebrows region was estimated from the eye region position.


Facial Landmarks Extraction
---------------------------------------------------
After facial regions detection, several image processing methods (e.g. histogram equalization, thresholding, color conversion, morphological operations, ...) are used to extract 20 facial landmarks.

<p align="center"><img src="https://raw.githubusercontent.com/carolinepacheco/FacialLandmarks/master/docs/landmarks.png" border="0" width="50%" height="50%" /></p>
<p align="center"> Facial Landmarks Detection. </p>


Experimental Results
---------------------------------------------------

The figures below show the cumulative distribution of landmarks similarity between image annotations. The proposed method is compared with the ASM method. As can be seen, the proposed method obtained inferior results in mouth and eyes, but better results in eyebrows.


<p align="center"><img src="https://raw.githubusercontent.com/carolinepacheco/FacialLandmarks/master/docs/mouth.jpg" border="0" /></p>

<p align="center"><img src="https://raw.githubusercontent.com/carolinepacheco/FacialLandmarks/master/docs/Left_eye.jpg" border="0" /></p>


<p align="center"><img src="https://raw.githubusercontent.com/carolinepacheco/FacialLandmarks/master/docs/Right_eye.jpg" border="0" /></p>

<p align="center"><img src="https://raw.githubusercontent.com/carolinepacheco/FacialLandmarks/master/docs/Left_eyebrow.jpg" border="0" /></p>


<p align="center"><img src="https://raw.githubusercontent.com/carolinepacheco/FacialLandmarks/master/docs/Right_eyebrow.jpg" border="0" /></p>


Citation
--------
If you use this code for your publications, please cite it as:
```
@inproceedings{silva Caroline
author    = {Silva, Caroline; Schnitman, Leizer ;  Oliveira, Luciano},
title     = {Detection of Facial Landmarks Using Local-Based Information},
booktitle = {Brazilian Conference on Automation},
year      = {2012},
url       = {https://www.researchgate.net/publication/271825271_Detection_of_Facial_Landmarks_Using_Local-Based_Information}
```