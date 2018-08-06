%% MyMainScript

tic;
%% myShrinkImageByFactorD
img = imread('../data/circles_concentric.png');
myDisplayImageGrey(img,'original image');

img2 = myShrinkImageByFactorD(img,2);
myDisplayImageGrey(img2,'shrinked image(d=2)');


img3 = myShrinkImageByFactorD(img,3);
myDisplayImageGrey(img3,'shrinked image(d=3)');

%% myBilinearInterpolation

img4 = imread('../data/barbaraSmall.png');
myDisplayImageGrey(img4,'original image');

img5 = myBilinearInterpolation(img4);
myDisplayImageGrey(img5,'Bilinear Interpolated Image');

%% myNearestNeighborInterpolation
myDisplayImageGrey(img4,'original image');

img6 = myNearestNeighborInterpolation(img4);
myDisplayImageGrey(img6,'Nearest neighbor interpolated image');

%% end
toc;
