%% MyMainScript

tic;
%% ORL dataset using eig
[train_X, train_Y, test_X, test_Y] = myDataset('orl');
[train_mean, V] = myEigenFace(train_X, 'eig');
ks = [1,2,3,5,10,15,20,30,50,75,100,150,170];
train_XC = bsxfun(@minus, train_X, train_mean);
recognition_rate = myTest(train_mean, V, train_XC, train_Y, test_X, test_Y, ks);
figure, plot(ks, recognition_rate);
xlabel('K');
ylabel('Recognition Rate');
title('Recognition Rate on ORL dataset using eig');

%% ORL dataset using svd
[train_mean, V] = myEigenFace(train_X, 'svd');

train_XC = bsxfun(@minus, train_X, train_mean);
recognition_rate = myTest(train_mean, V, train_XC, train_Y, test_X, test_Y, ks);
figure, plot(ks, recognition_rate);
xlabel('K');
ylabel('Recognition Rate');
title('Recognition Rate on ORL dataset using svd');

%% Yale Dataset before removing 3 largest eigenvalues
[train_X, train_Y, test_X, test_Y] = myDataset('yale'); 
[train_mean, V] = myEigenFace(train_X, 'svd');
ks = [1,2,3,5,10,15,20,30,50,60,65,75,100,200,300,500,1000];
train_X = bsxfun(@minus, train_X, train_mean);
[N, M] = size(V);
recognition_rate = myTest(train_mean, V, train_X, train_Y, test_X, test_Y, ks);
figure, plot(ks, recognition_rate);
xlabel('K');
ylabel('Recognition Rate');
title('Recognition Rate on Yale dataset before removing 3 largest eigenvalue');

%% Yale Dataset after removing 3 largest eigenvalues
V = V(:, 4:M);
recognition_rate = myTest(train_mean, V, train_X, train_Y, test_X, test_Y, ks);
figure, plot(ks, recognition_rate);
xlabel('K');
ylabel('Recognition Rate');
title('Recognition Rate on Yale dataset after removing 3 largest eigenvalue');
toc;
