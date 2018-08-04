%% MyMainScript

tic;
%% Your code here
img = imread('../data/barbara.png');
figure('Name','Original Image');
imshow(img);
axis on
% colormap(jet(200))
% colorbar

% imgRef = imread('../data/retinaRef.png');
% figure('Name','Reference Image');
% imshow(imgRef);
% axis on
% colormap(jet(200))
% colorbar

figure('Name','Contrast image');
img2 = myAHE(img,101);
imshow(mat2gray(img2));
axis on
% colormap(jet(200))
% colorbar

toc;
