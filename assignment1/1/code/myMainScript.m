%% MyMainScript

tic;
%% Your code here

img = imread('../data/circles_concentric.png');
figure('Name','Original Image');
imshow(img);
axis on
colormap(jet(200))
colorbar

figure('Name','shrinked image(d=2)');
img2 = myShrinkImageByFactorD(img,2);
imshow(img2);
axis on
colormap(jet(200))
colorbar

figure('Name','shrinked image(d=3)');
img3 = myShrinkImageByFactorD(img,3);
imshow(img3);
axis on
colormap(jet(200))
colorbar

img = imread('../data/barbaraSmall.png');
figure('Name','Original Image');
imshow(img);
colormap(jet(200))
toc;
