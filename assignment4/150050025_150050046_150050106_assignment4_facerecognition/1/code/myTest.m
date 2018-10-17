function correct = myTest(train_mean, V, train_X, train_Y, test_X, test_Y, ks)
	[d_tr, N_tr] = size(train_X);
	[d_te, N_te] = size(test_X);

	correct = zeros([numel(ks),1]);
	
	for k=1:numel(ks)
		dim = ks(1, k);
		Vk = V(:, 1:dim);

		train_eig_coeff = transpose(Vk) * train_X;

		test_XC = bsxfun(@minus, test_X, train_mean);
		test_eig_coeff = transpose(Vk) * test_XC;

		for itr = 1:N_te
			sub_coeff = bsxfun(@minus, train_eig_coeff, test_eig_coeff(:, itr));
			sq_coeff = sub_coeff.^2;
			sum_coeff = sum(sq_coeff, 1);

			index = find(sum_coeff==min(sum_coeff));
			if train_Y(index) == test_Y(itr)
				correct(k) = correct(k) + 1;
			end
		end
	end
	correct = correct * (100.0/ N_te);
end