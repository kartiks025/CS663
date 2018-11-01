function img2 = myPCADenoising1(img1, patchSize, sig)
	imgSize = size(img1);

	% Eigenvalue decomposition of P*P'
	P = im2col(img1, patchSize, 'sliding');
	[t, N] = size(P);
	Q = P * transpose(P);
	[V, D, W] = eig(Q);
	eigCoeff = transpose(V) * P;

	% Computing the estimates for each eigen coefficients
	sqEigCoeff = sum(eigCoeff.^2, 2);
	est = max(0, (sqEigCoeff./N) - sig*sig);
	isnr = (est.^(-1)).*(sig*sig);
	fraction = (isnr + 1).^(-1);
	denoisedEigCoeff = bsxfun(@times, eigCoeff, fraction);
	denoisedP = V * denoisedEigCoeff;

	% Reconstructing the image from denoised patches
	indices = reshape(1:imgSize(1)*imgSize(2),imgSize);
	subst = im2col(indices, patchSize, 'sliding');
	img2 = accumarray(subst(:),denoisedP(:))./accumarray(subst(:),1);
	img2 = reshape(img2,imgSize(1),imgSize(2));
end