%% MyMainScript

tic;
clear;

A = rand(100,151);
mySVD(A);
% very small error, thus mySVD is correct

toc;