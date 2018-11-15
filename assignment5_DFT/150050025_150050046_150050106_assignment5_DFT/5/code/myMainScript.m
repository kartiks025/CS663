%% MyMainScript

tic;
%% Barabara Image
sig = 20;
patchSize = [7,7];
K = 200;
W = 31;
sigSpace = 2.5;
sigIntensity = 45.0;
windowSize = 31;

img = imread('../data/barbara256.png');
img = double(img);
img1 = img + randn(size(img))*sig;

myDisplayImage(img, false, 'Original Image');
myDisplayImage(max(0, img1), false, 'Noisy Image');
rmse1 = myRMSE(img1, img);
fprintf('RMSE of Noisy Image wrt Original Image is %f\n', rmse1);
%% Part A, Image denoising using global PCA features
img2 = myPCADenoising1(img1, patchSize, sig);
myDisplayImage(max(0, img2), false, 'Denoised Image Global');
rmse2 = myRMSE(img2, img);
fprintf('RMSE of Noisy Image wrt Original Image is %f\n', rmse2);

%% Part B, Image denoising using non-local PCA features
img3 = myPCADenoising2(img1, patchSize, sig, K, W);
myDisplayImage(max(0, img3), false, 'Denoised Image Local');
rmse3 = myRMSE(img3, img);
fprintf('RMSE of Noisy Image wrt Original Image is %f\n', rmse3);

%% Part C, Image denoising using Bilateral Filtering
img4 = myBilateralFiltering(img1, sigSpace, sigIntensity, windowSize);
myDisplayImage(max(0, img4), false, 'Denoised Image Bilateral Filter');
rmse4 = myRMSE(img4, img);
fprintf('RMSE of Noisy Image wrt Original Image is %f\n', rmse4);

%% Part D, a), Image denoising for Poisson Noise
img1 = poissrnd(img);
img5 = myPCADenoising2(sqrt(img1), patchSize, 0.25, K, W);
img5 = img5.^2;
rmse5 = myRMSE(img5, img);
myDisplayImage(max(0, img5), false, 'Denoised Image for Poisson');
fprintf('RMSE of Noisy Image wrt Original Image is %f\n', rmse5);

%% Part D, b), Image denoising for low exposure
img1 = poissrnd(img/20);
img6 = myPCADenoising2(sqrt(img1), patchSize, 0.25, K, W);
img6 = img6.^2;
rmse6 = myRMSE(img6, img);
myDisplayImage(max(0, img6), false, 'Denoised Image for low exposure');
fprintf('RMSE of Noisy Image wrt Original Image is %f\n', rmse6);

toc;
