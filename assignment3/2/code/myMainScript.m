%% MyMainScript

tic;
%% Your code here
imageOrig = imread('../data/baboonColor.png');
imageOrig = imgaussfilt(imageOrig, 1.0);     
imageOrig = imresize(imageOrig, 0.5);

h1 = 0.02;
h2 = 150;
rate = 2.0;
segmentImage = myMeanShiftSegmentation(imageOrig, h1, h2, rate);
myDisplayTwoImage(imageOrig, segmentImage);

toc;
