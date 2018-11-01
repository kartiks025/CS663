function img2 = myPCADenoising1(img1, patchSize, sig, K, W)
	imgSize = size(img1);
	winOffset = (W-1)/2;
	patchOffset = (patchSize(1)-1)/2;

	N = (imgSize(1)-patchSize(1)+1)*(imgSize(2)-patchSize(2)+1);

	img2 = double(zeros(imgSize));
	count = double(zeros(imgSize));
	index = 1;
	for j = patchOffset+1:imgSize(1)-patchOffset
		for i = patchOffset+1:imgSize(2)-patchOffset
			minX = max(1, i-winOffset);
			minY = max(1, j-winOffset);
			maxX = min(imgSize(1), i+winOffset);
			maxY = min(imgSize(2), j+winOffset);

			Qi = im2col(img1(minX:maxX, minY:maxY), patchSize, 'sliding');
			Pi = img1(i-patchOffset:i+patchOffset, j-patchOffset:j+patchOffset);
			Pi = Pi(:);
			idx = knnsearch(transpose(Qi), transpose(Pi), 'k', K);
			Q = Qi(:, idx);

			[V, D, W] = eig(Q * transpose(Q));
			eigCoeff = transpose(V) * Q;

			sqEigCoeff = sum(eigCoeff.^2, 2);
			est = max(0, (sqEigCoeff./K) - sig*sig);
			isnr = (est.^(-1)).*(sig*sig);
			fraction = (isnr + 1).^(-1);

			PiEigCoeff = transpose(V) * Pi;
			denoisedEigCoeff = PiEigCoeff .* fraction;
			Pi = V * denoisedEigCoeff;

			img2(i-patchOffset:i+patchOffset, j-patchOffset:j+patchOffset) = img2(i-patchOffset:i+patchOffset, j-patchOffset:j+patchOffset) + reshape(Pi, patchSize);
			count(i-patchOffset:i+patchOffset, j-patchOffset:j+patchOffset) = count(i-patchOffset:i+patchOffset, j-patchOffset:j+patchOffset) + 1;

			index = index + 1;
		end
	end

	% Reconstructing the image from denoised patches
	img2 = img2 ./ count;
end