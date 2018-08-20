%% MyMainScript

tic;
%% Super Moon Crop
imageData = load('../data/superMoonCrop.mat');
image = imageData.imageOrig;
stretchedImage = myLinearContrastStretching(image);
sharpImage = myUnsharpMasking(image,1.1,9,1.1);
sharpImage = myLinearContrastStretching(sharpImage);
myDisplayTwoImage(stretchedImage,sharpImage);
%% Lion Crop
imageData = load('../data/lionCrop.mat');
image = imageData.imageOrig;
stretchedImage = myLinearContrastStretching(image);
sharpImage = myUnsharpMasking(image,1.1,9,1.6);
sharpImage = myLinearContrastStretching(sharpImage);
myDisplayTwoImage(stretchedImage,sharpImage);
toc;