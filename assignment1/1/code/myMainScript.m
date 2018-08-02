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

img4 = imread('../data/barbaraSmall.png');
figure('Name','Original Image');
imshow(img4);
axis on
colormap(jet(200))
colorbar

figure('Name','Bilinear Interpolated Image');
img5 = myBilinearInterpolation(img4);
imshow(mat2gray(img5));
axis on
colormap(jet(200))
colorbar

figure('Name','Original Image');
imshow(img4);
axis on
colormap(jet(200))
colorbar

figure('Name','Nearest Neighbor Interpolated Image');
img6 = myNearestNeighborInterpolation(img4);
imshow(mat2gray(img6));
axis on
colormap(jet(200))
colorbar

toc;
