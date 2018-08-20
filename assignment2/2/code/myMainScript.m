%% MyMainScript

tic;
%% Your code here
%% Bilateral filtering
imageData = load('../data/barbara.mat');
image = imageData.imageOrig;
[len, wid] = size(image);
corruptedImage = image + 0.05*(max(max(image))-min(min(image)))*randn(len);


figure,imshow(mat2gray(image));
out = myBilateralFiltering(corruptedImage, 1.3, 4, 5);
rsmd = sqrt(sum(sum((out-image).^2))/(len*wid))
figure,imshow(mat2gray(corruptedImage));
figure,imshow(mat2gray(out));

toc;
