function myPlotEigenFaces(train_mean, V)
	[d, N] = size(V);
	h = 192;
	w = 168;

	for k=1:25
		eigen_face = V(:, k);
		eigen_face = eigen_face;
		eigen_face = mat2gray(eigen_face);
		eigen_face = reshape(eigen_face, h, w);

		subplot(5,5,k), subimage(eigen_face);
		axis off;
		txt = sprintf('EigenFace %d', k);
		title(txt);
	end
end