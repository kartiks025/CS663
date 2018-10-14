%% MyMainScript

tic;
%% Harris Corner Detector
image  = load('../data/boat.mat');
inputImage = reScale(image.imageOrig);

figure, imshow(inputImage);
title('OriginalImage');
myHarrisCornerDetector(inputImage, 1, 0.15, 10);
toc;
