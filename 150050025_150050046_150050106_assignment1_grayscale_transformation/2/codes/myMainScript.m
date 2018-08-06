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


%% myLinearContrastStretching
imshow(uint8(img1));
title('Barbara');

axis on;
colormap(gray(200));
colorbar;

img1a = myLinearContrastStretching(img1);
imshow(uint8(img1a));
title('Contrast image Barbara');

axis on;
colormap(gray(200));
colorbar;

imshow(uint8(img2));
title('TEM');

axis on;
colormap(gray(200));
colorbar;

img2a = myLinearContrastStretching(img2);
imshow(uint8(img2a));
title('Contrast image TEM');

axis on;
colormap(gray(200));
colorbar;

imshow(uint8(img3));
title('Canyon');

axis on;
colormap(jet(200));
colorbar;

img3a = myLinearContrastStretching(img3);
imshow(uint8(img3a));
title('Contrast image Canyon');

axis on;
colormap(jet(200));
colorbar;

imshow(uint8(img5));
title('Church');

axis on;
colormap(jet(200));
colorbar;

img5a = myLinearContrastStretching(img5);
imshow(uint8(img5a));
title('Contrast image Church');

axis on;
colormap(jet(200));
colorbar;

%% myHE
imshow(uint8(img1));
title('Barbara');

axis on;
colormap(gray(200));
colorbar;

img1b = myHE(img1);
imshow(uint8(img1b));
title('Contrast image Barbara');

axis on;
colormap(gray(200));
colorbar;

imshow(uint8(img2));
title('TEM');

axis on;
colormap(gray(200));
colorbar;

img2b = myHE(img2);
imshow(uint8(img2b));
title('Contrast image TEM');

axis on;
colormap(gray(200));
colorbar;

imshow(uint8(img3));
title('Canyon');

axis on;
colormap(jet(200));
colorbar;

img3b = myHE(img3);
imshow(uint8(img3b));
title('Contrast image Canyon');

axis on;
colormap(jet(200));
colorbar;

imshow(uint8(img5));
title('Church');

axis on;
colormap(jet(200));
colorbar;

img5b = myHE(img5);
imshow(uint8(img5b));
title('Contrast image Church');

axis on;
colormap(jet(200));
colorbar;

%%myHM
imshow(uint8(img4));
title('Retina');

axis on;
colormap(jet(200));
colorbar;

img4ce = myHE(img4);
imshow(uint8(img4ce));
title('Retina HE');

axis on;
colormap(jet(200));
colorbar;

img4linear = img4(:);
img4reflinear = img4ref(:);
img4linearm = img4m(:);
img4reflinearm = img4refm(:);
img4cm = myHM(img4linear(img4linearm==1),img4reflinear(img4reflinearm==1));
imshow(uint8(img4cm));
title('Retina HM');

axis on;
colormap(jet(200));
colorbar;

%%myAHE
imshow(uint8(img1));
title('Barbara');

axis on;
colormap(gray(200));
colorbar;

img1d = myAHE(img1,121);
imshow(uint8(img1d));
title('Contrast image Barbara 121');

axis on;
colormap(gray(200));
colorbar;

img1d = myAHE(img1,201);
imshow(uint8(img1d));
title('Contrast image Barbara 201');

axis on;
colormap(gray(200));
colorbar;

img1d = myAHE(img1,51);
imshow(uint8(img1d));
title('Contrast image Barbara 51');

axis on;
colormap(gray(200));
colorbar;

imshow(uint8(img2));
title('TEM');

axis on;
colormap(gray(200));
colorbar;

img2d = myAHE(img2,121);
imshow(uint8(img2d));
title('Contrast image TEM');

axis on;
colormap(gray(200));
colorbar;

img2d = myAHE(img2,201);
imshow(uint8(img2d));
title('Contrast image TEM 201');

axis on;
colormap(gray(200));
colorbar;

img2d = myAHE(img2,51);
imshow(uint8(img2d));
title('Contrast image TEM 51');

axis on;
colormap(gray(200));
colorbar;

imshow(uint8(img3));
title('Canyon');

axis on;
colormap(jet(200));
colorbar;

img3d = myAHE(img3,121);
imshow(uint8(img3d));
title('Contrast image Canyon');

axis on;
colormap(jet(200));
colorbar;

img3d = myAHE(img3,201);
imshow(uint8(img3d));
title('Contrast image Canyon 201');

axis on;
colormap(jet(200));
colorbar;

img3d = myAHE(img3,51);
imshow(uint8(img3d));
title('Contrast image Canyon 51');

axis on;
colormap(jet(200));
colorbar;


%%myCLAHE
imshow(uint8(img1));
title('Barbara');

axis on;
colormap(gray(200));
colorbar;

img1e = myCLAHE(img1,121,0.01);
imshow(uint8(img1e));
title('Contrast image Barbara 0.01');

axis on;
colormap(gray(200));
colorbar;

img1e = myCLAHE(img1,121,0.005);
imshow(uint8(img1e));
title('Contrast image Barbara 0.005');

axis on;
colormap(gray(200));
colorbar;

imshow(uint8(img2));
title('TEM');

axis on;
colormap(gray(200));
colorbar;

img2e = myCLAHE(img2,121,0.01);
imshow(uint8(img2e));
title('Contrast image TEM 0.01');

axis on;
colormap(gray(200));
colorbar;

img2e = myCLAHE(img2,121,0.005);
imshow(uint8(img2e));
title('Contrast image TEM 0.005');

axis on;
colormap(gray(200));
colorbar;

imshow(uint8(img3));
title('Canyon');

axis on;
colormap(jet(200));
colorbar;

img3e = myCLAHE(img3,121,0.01);
imshow(uint8(img3e));
title('Contrast image Canyon 0.01');

axis on;
colormap(jet(200));
colorbar;

img3e = myCLAHE(img3,121,0.005);
imshow(uint8(img3e));
title('Contrast image Canyon 0.005');

axis on;
colormap(jet(200));
colorbar;

%%end
toc;
