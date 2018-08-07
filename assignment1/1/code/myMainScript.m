%% MyMainScript

tic;
%% myShrinkImageByFactorD
img = imread('../data/circles_concentric.png');

imshow(img);
title('Name','Original Image');
axis on;
colormap(jet(200));
colorbar;

img2 = myShrinkImageByFactorD(img,2);
imshow(img2);
title('Name','shrinked image(d=2)');

axis on;
colormap(jet(200));
colorbar;

img3 = myShrinkImageByFactorD(img,3);
imshow(img3);
title('Name','shrinked image(d=3)');

axis on;
colormap(jet(200));
colorbar;

%% myBilinearInterpolation

img4 = imread('../data/barbaraSmall.png');
imshow(img4);
title('Name','Original Image');

axis on;
colormap(jet(200));
colorbar;

img5 = myBilinearInterpolation(img4);
imshow(uint8(img5));
title('Name','Bilinear Interpolated Image');

axis on;
colormap(jet(200));
colorbar;

%% myNearestNeighborInterpolation

imshow(img4);
title('Name','Original Image');

axis on;
colormap(jet(200));
colorbar;

img6 = myNearestNeighborInterpolation(img4);
imshow(uint8(img6));
title('Name','Nearest Neighbor Interpolated Image');

axis on;
colormap(jet(200));
colorbar;

%% end
toc;
