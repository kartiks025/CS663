function filterImg = myPatchBasedFiltering(img, patchSize, windowSize, h)
	[len, wid] = size(img);
	
	paddedImage = padarray(img, [(patchSize(1)-1)/2, (patchSize(2)-1)/2], 'symmetric', 'both');
	
	gaussianFilter = fspecial('gaussian', patchSize, double(patchSize(1))/6);
	gaussianFilter = gaussianFilter/(sum(gaussianFilter(:)));
	gaussianFilterVector = gaussianFilter(:);
	
	featureImage = im2col(paddedImage, patchSize);
	featureImage = bsxfun(@times, featureImage, gaussianFilterVector);
	% Feature Image is of the same size as of the original image with last dimension equal to feature dimension
	featureImage = permute(reshape(featureImage, [patchSize(1)*patchSize(2), len, wid]), [2,3,1]);

	constant1 = (windowSize(1)-1)/2;
	constant2 = (windowSize(1)+1)/2;

	filterImg = zeros(size(img));

	for i=1:len
		for j=1:wid
			minI = (i-constant1);
			maxI = (i+constant1);
			minJ = (j-constant1);
			maxJ = (j+constant1);
			if i < constant2
				minI = 1;
			elseif i > (len-constant1)
				maxI = len;
			end
			if j < constant2
				minJ = 1;
			elseif j > (wid-constant1)
				maxJ = wid;	 
			end

			patch = featureImage(minI:maxI, minJ:maxJ, :);
			sumSquareDiffernce = sum(bsxfun(@minus, patch, featureImage(i,j,:)).^2, 3);
			expSumSquareDiffernce = exp(sumSquareDiffernce*(-1.0/h));
			dotWiseMult = img(minI:maxI, minJ:maxJ).*expSumSquareDiffernce;
			filterImg(i,j) = sum(dotWiseMult(:))/sum(expSumSquareDiffernce(:));
		end
	end
end