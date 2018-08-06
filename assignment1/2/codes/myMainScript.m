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


<<<<<<< HEAD
%% myLinearContrastStretching
figure('Name','Barbara');
imshow(uint8(img1));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image Barbara');
img1a = myLinearContrastStretching(img1);
imshow(uint8(img1a));
axis on;
colormap(gray(200));
colorbar;

figure('Name','TEM');
imshow(uint8(img2));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image TEM');
img2a = myLinearContrastStretching(img2);
imshow(uint8(img2a));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Canyon');
imshow(uint8(img3));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Contrast image Canyon');
img3a = myLinearContrastStretching(img3);
imshow(uint8(img3a));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Church');
imshow(uint8(img5));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Contrast image Church');
img5a = myLinearContrastStretching(img5);
imshow(uint8(img5a));
axis on;
colormap(jet(200));
colorbar;

%% myHE
figure('Name','Barbara');
imshow(uint8(img1));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image Barbara');
img1b = myHE(img1);
imshow(uint8(img1b));
axis on;
colormap(gray(200));
colorbar;

figure('Name','TEM');
imshow(uint8(img2));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image TEM');
img2b = myHE(img2);
imshow(uint8(img2b));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Canyon');
imshow(uint8(img3));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Contrast image Canyon');
img3b = myHE(img3);
imshow(uint8(img3b));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Church');
imshow(uint8(img5));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Contrast image Church');
img5b = myHE(img5);
imshow(uint8(img5b));
axis on;
colormap(jet(200));
colorbar;

%%myHM
figure('Name','Retina');
imshow(uint8(img4));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Retina HE');
img4ce = myHE(img4);
imshow(uint8(img4ce));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Retina HM');
img4linear = img4(:);
img4reflinear = img4ref(:);
img4linearm = img4m(:);
img4reflinearm = img4refm(:);
img4cm = myHM(img4linear(img4linearm==1),img4reflinear(img4reflinearm==1));
imshow(uint8(img4cm));
axis on;
colormap(jet(200));
colorbar;

%%myAHE
figure('Name','Barbara');
imshow(uint8(img1));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image Barbara 121');
img1d = myAHE(img1,121);
imshow(uint8(img1d));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image Barbara 201');
img1d = myAHE(img1,201);
imshow(uint8(img1d));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image Barbara 51');
img1d = myAHE(img1,51);
imshow(uint8(img1d));
axis on;
colormap(gray(200));
colorbar;

figure('Name','TEM');
imshow(uint8(img2));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image TEM');
img2d = myAHE(img2,121);
imshow(uint8(img2d));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image TEM 201');
img2d = myAHE(img2,201);
imshow(uint8(img2d));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image TEM 51');
img2d = myAHE(img2,51);
imshow(uint8(img2d));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Canyon');
imshow(uint8(img3));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Contrast image Canyon');
img3d = myAHE(img3,121);
imshow(uint8(img3d));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Contrast image Canyon 201');
img3d = myAHE(img3,201);
imshow(uint8(img3d));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Contrast image Canyon 51');
img3d = myAHE(img3,51);
imshow(uint8(img3d));
axis on;
colormap(jet(200));
colorbar;


%%myCLAHE
figure('Name','Barbara');
imshow(uint8(img1));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image Barbara 0.01');
img1e = myCLAHE(img1,121,0.01);
imshow(uint8(img1e));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image Barbara 0.005');
img1e = myCLAHE(img1,121,0.005);
imshow(uint8(img1e));
axis on;
colormap(gray(200));
colorbar;

figure('Name','TEM');
imshow(uint8(img2));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image TEM 0.01');
img2e = myCLAHE(img2,121,0.01);
imshow(uint8(img2e));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Contrast image TEM 0.005');
img2e = myCLAHE(img2,121,0.005);
imshow(uint8(img2e));
axis on;
colormap(gray(200));
colorbar;

figure('Name','Canyon');
imshow(uint8(img3));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Contrast image Canyon 0.01');
img3e = myCLAHE(img3,121,0.01);
imshow(uint8(img3e));
axis on;
colormap(jet(200));
colorbar;

figure('Name','Contrast image Canyon 0.005');
img3e = myCLAHE(img3,121,0.005);
imshow(uint8(img3e));
axis on;
colormap(jet(200));
colorbar;

%%end
toc;
