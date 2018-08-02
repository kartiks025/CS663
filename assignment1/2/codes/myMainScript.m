%% MyMainScript

tic;
%% Your code here
img = imread('../data/retina.png');
figure('Name','Original Image');
imshow(img);
axis on
colormap(jet(200))
colorbar

imgRef = imread('../data/retinaRef.png');
figure('Name','Reference Image');
imshow(imgRef);
axis on
colormap(jet(200))
colorbar

figure('Name','Contrast image');
img2 = myHM(img,imgRef);
imshow(mat2gray(img2));
axis on
colormap(jet(200))
colorbar

toc;
