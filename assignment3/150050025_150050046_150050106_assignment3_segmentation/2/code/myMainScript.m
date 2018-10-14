%% MyMainScript

tic;
%% Baboon Color
imageOrig = imread('../data/baboonColor.png');
imageOrig = imgaussfilt(imageOrig, 1.0);     
imageOrig = imresize(imageOrig, 0.5);

h1 = 250;
h2 = 250;
rate = 1.0;

segmentImage = myMeanShiftSegmentation(imageOrig, h1, h2, rate);
myDisplayTwoImage(imageOrig, segmentImage);

toc;
