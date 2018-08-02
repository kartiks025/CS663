%% MyMainScript

tic;
%% Your code here

img = imread('../data/circles_concentric.png');
figure('Name','Original Image');
imshow(img);

figure('Name','shrinked image(d=2)');
img2 = myShrinkImageByFactorD(img,2);
imshow(img2);

figure('Name','shrinked image(d=3)');
img3 = myShrinkImageByFactorD(img,3);
imshow(img3);

toc;
