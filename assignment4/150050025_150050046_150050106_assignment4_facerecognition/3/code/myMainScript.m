tic;
%% Screening images not from the database using threshold
[train_X, test_X, rem_X] = myDataset(); 
[train_mean, V] = myEigenFace(train_X, 'svd');

[d, N_te] = size(test_X);
[d, N_re] = size(rem_X);
train_X = bsxfun(@minus,train_X,train_mean);
test_X = bsxfun(@minus,test_X,train_mean);
rem_X = bsxfun(@minus,rem_X,train_mean);

k = 100;
thresh = 2500; % Threshold value
V = V(:,1:k);

coeffTrain = transpose(V) * train_X;
coeffTest = transpose(V) * test_X;
coeffRem = transpose(V) * rem_X;

expected1 = dsearchn(coeffTrain', coeffTest');
sub1 = coeffTest - coeffTrain(:,expected1(:));
sqrtDistances1 = sqrt(sum((sub1).^2));
falseNegatives = 0;
for i = 1:32*4
    if(sqrtDistances1(i)>thresh)
        falseNegatives = falseNegatives+1;
    end
end

expected2 = dsearchn(coeffTrain', coeffRem');
sub2 = coeffRem - coeffTrain(:,expected2(:));
sqrtDistances2 = sqrt(sum((sub2).^2));
falsePositives = 0;
for i = 1:8*10
    if sqrtDistances2(i) <= thresh
        falsePositives = falsePositives+1;
    end
end
disp(falsePositives);
disp(falseNegatives);
toc;