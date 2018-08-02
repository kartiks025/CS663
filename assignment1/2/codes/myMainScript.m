%% MyMainScript

tic;
%% Your code here
img = imread('../data/church.png');
figure('Name','Original Image');
imshow(img);
axis on
colormap(jet(200))
colorbar

figure('Name','Contrast image');
img2 = myLinearContrastStretching(img);
imshow(mat2gray(img2));
axis on
colormap(jet(200))
colorbar

toc;
