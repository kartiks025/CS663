function myReconstruction(train_mean, V, train_X, img, ks)
	[d_tr, N_tr] = size(train_X);

	h = 192;
	w = 168;
	img = img - train_mean;
	for k=1:numel(ks)
		dim = ks(1, k);
		Vk = V(:, 1:dim);

		img_coeff = transpose(Vk) * img;
		reconstructed_img = (Vk * img_coeff) + train_mean;
		reconstructed_img = mat2gray(reconstructed_img);
		reconstructed_img = reshape(reconstructed_img, h, w);
		subplot(3,3,k), subimage(reconstructed_img);
		axis off;
		txt = sprintf('Reconstruction K = %d', dim);
		title(txt);
end