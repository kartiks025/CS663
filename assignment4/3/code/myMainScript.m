%% MyMainScript

tic;
clear;
%% Your Code Here
[train_X, test_X, new_X] = myDataset(); 

train_X = double(train_X);
meanX = double(mean(train_X,2));

train_X = bsxfun(@minus,train_X,meanX);
test_X = bsxfun(@minus,test_X,meanX);
new_X = bsxfun(@minus,new_X,meanX);

[train_mean, V] = myEigenFace(train_X, 'eig');

coeffTrain = V'*train_X;
coeffTest = V'*test_X;
coeffNew = V'*new_X;

expected1 = dsearchn(coeffTrain', coeffTest');
sqrtDistances1 = sqrt(sum((coeffTest - coeffTrain(:,expected1(:))).^2));
disp(sqrtDistances1(1));
thresh = 2800;
falseNegatives = 0;
for i = 1:32*4
    if(sqrtDistances1(i)>thresh)
        falseNegatives = falseNegatives+1;
    end
end

expected2 = dsearchn(coeffTrain', coeffNew');
sqrtDistances2 = sqrt(sum((coeffNew - coeffTrain(:,expected2(:))).^2));

disp(sqrtDistances2(1));
falsePositives = 0;
for i = 1:8*10
    if(sqrtDistances2(i)<thresh)
        falsePositives = falsePositives+1;
    end
end
disp(falsePositives);
disp(falseNegatives);

toc;