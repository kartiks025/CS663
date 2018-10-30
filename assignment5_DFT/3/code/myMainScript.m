%% MyMainScript

tic;
%% Your code here
img = load('../data/image_low_frequency_noise.mat');
img = img.Z;
[m,n] = size(img);
fftImg = logFourier(img);
u1 = [236-m, 278-m];
v1 = [247-n, 268-m];
myNotchFilter(fftImg, u1, v1, 30);
toc;
