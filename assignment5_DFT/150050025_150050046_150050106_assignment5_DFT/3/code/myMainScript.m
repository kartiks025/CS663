%% MyMainScript

tic;
%% Your code here
img = load('../data/image_low_frequency_noise.mat');
img = img.Z;
myDisplayImage(img, false, 'Original image');
[m,n] = size(img);
fftImg = logFourier(img);
u1 = [236-m/2, 278-m/2];
v1 = [247-n/2, 268-n/2];
myNotchFilter(fftImg, u1, v1, 30);
toc;
