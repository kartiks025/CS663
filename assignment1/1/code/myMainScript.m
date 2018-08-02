%% MyMainScript

tic;
%% Your code here

img = imread('../data/circles_concentric.png');
figure('Name','Original Image');
imshow(img);
colormap(jet(200))

figure('Name','shrinked image(d=2)');
img2 = myShrinkImageByFactorD(img,2);
imshow(img2);
colormap(jet(200))

figure('Name','shrinked image(d=3)');
img3 = myShrinkImageByFactorD(img,3);
imshow(img3);
colormap(jet(200))

img = imread('../data/barbaraSmall.png');
figure('Name','Original Image');
imshow(img);
colormap(jet(200))
toc;
