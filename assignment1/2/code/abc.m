%% MyMainScript

tic;
img1 = imread('../data/barbara.png');
img2 = imread('../data/TEM.png');
img3 = imread('../data/canyon.png');
img4 = imread('../data/retina.png');
img4ref = imread('../data/retinaRef.png');
img4m = imread('../data/retinaMask.png');
img4refm = imread('../data/retinaRefMask.png');
img5 = imread('../data/church.png');

%% myHM
myDisplayImageColor(img4,'OriginalImage');
img4cm = myHM(img4, img4m, img4ref, img4refm);
myDisplayImageColor(img4cm,'Histogram Matched Image');
img4ce = myHE(img4);
myDisplayImageColor(img4ce,'Histogram Matched Image');