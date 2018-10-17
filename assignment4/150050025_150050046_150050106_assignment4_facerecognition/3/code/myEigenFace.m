function [train_mean, V] = myEigenFace(train_X, method)
	[d, N_tr] = size(train_X);
	train_mean = mean(train_X, 2);
	train_X = bsxfun(@minus, train_X, train_mean);

	if strcmp(method, 'eig')
		L = transpose(train_X) * train_X;
		L = L ./ (N_tr - 1);
		[W, T] = eig(L);
	end
	if strcmp(method, 'svd')
		[U, T, W] = svds(train_X, N_tr-1);
	end
	V = train_X * W;
	V = normc(V);

	[t, ind] = sort(diag(T), 'descend');
	V = V(:, ind);
end