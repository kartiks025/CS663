%% MyMainScript

tic;
%% Your code here

img = imread('../data/barbara256.png');
myDisplayImage(img,false,'Original Image');
myIdealLowPassFilter(img,40);
myIdealLowPassFilter(img,80);

myGaussianLowPassFilter(img,40);
myGaussianLowPassFilter(img,80);

toc;
