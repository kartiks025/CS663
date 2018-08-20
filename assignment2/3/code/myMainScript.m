%% MyMainScript

tic;
%% Setting up image loading and colormap
% load('../data/grassNoisy.mat');
% load('../data/honeyCombReal_Noisy.mat');

myNumOfColors = 200;
myColorScale = [ [0:1/(myNumOfColors-1):1]' , ...
[0:1/(myNumOfColors-1):1]', [0:1/(myNumOfColors-1):1]'];

%% Filtering Barbara image
load('../data/barbara.mat');

imshow(mat2gray(imageOrig));
imshow(mat2gray(imgCorrupt));	
% imagesc (single (mat2gray(imageOrig))); 
% colormap (myColorScale);
% colormap jet;
% daspect ([1 1 1]);
% axis tight;
% colorbar

% imagesc (single (mat2gray(imgCorrupt)));
% colormap (myColorScale);
% colormap jet;
% daspect ([1 1 1]);
% axis tight;
% colorbar

toc;
