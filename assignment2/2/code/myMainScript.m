%% MyMainScript

tic;
%% Barbara
imageData = load('../data/barbara.mat');
image = imageData.imageOrig;
[len, wid] = size(image);
corruptedImage = image + 0.05*(max(max(image))-min(min(image)))*randn(len);

sigmaSpace = 1.6;
sigmaIntensity = 13.4;
windowSize = 4;
out = myBilateralFiltering(corruptedImage, sigmaSpace, sigmaIntensity, windowSize);
rsmd = myRsmd(out,image);
display(rsmd);
myDisplayThreeImage(image,corruptedImage,out);

out1 = myBilateralFiltering(corruptedImage, 0.9*sigmaSpace, sigmaIntensity, windowSize);
rsmd1 = myRsmd(out1,image);
display(rsmd1);

out2 = myBilateralFiltering(corruptedImage, 1.1*sigmaSpace, sigmaIntensity, windowSize);
rsmd2 = myRsmd(out2,image);
display(rsmd2);

out3 = myBilateralFiltering(corruptedImage, sigmaSpace, 0.9*sigmaIntensity, windowSize);
rsmd3 = myRsmd(out3,image);
display(rsmd3);

out4 = myBilateralFiltering(corruptedImage, sigmaSpace, 1.1*sigmaIntensity, windowSize);
rsmd4 = myRsmd(out4,image);
display(rsmd4);


toc;
