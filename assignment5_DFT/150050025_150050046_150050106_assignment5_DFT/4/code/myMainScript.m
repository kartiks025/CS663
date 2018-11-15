%% MyMainScript

tic;
%% Your code here
img = imread('../data/barbara256.png');
myDisplayImage(img,false,'Original Image');

%% Ideal Low Pass Filter
myIdealLowPassFilter(img,40);
myIdealLowPassFilter(img,80);

%% Gaussian Low Pass Filter
myGaussianLowPassFilter(img,40);
myGaussianLowPassFilter(img,80);

%% Comment on difference in the outputs
% There are ringing artifacts present in case of ideal low pass filter as
% it generates a sine wave as fourier transform which has multiple peaks
% around each pixel, this does not occur in case of gaussian filter as
% there is only 1 peak.

toc;
