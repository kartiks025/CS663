function segmentedImage = myMeanShiftSegmentation(img, h1, h2, rate)
	[len, wid, c] = size(img);

	segmentedImage = zeros(size(img));
	featureMatrix = zeros([len, wid, c+2]);

	colorMatrix(:,:,:) = double(img);

	distanceMatrix(:,:,1) = double(repmat((1:wid), len, 1));
	distanceMatrix(:,:,2) = double(repmat((1:len)', 1, wid));

	featureMatrix(:,:,1:c) = colorMatrix;
	featureMatrix(:,:,c+1:c+2) = distanceMatrix;

	columnFeatureMatrix = reshape(featureMatrix, len*wid, c+2);

	temporaryFeatureMatrix = zeros(size(columnFeatureMatrix));

	diagH1 = diag(h1*ones(c, 1));
	diagH2 = diag(h2*ones(2, 1));

	for t=1:2
		display(size(unique(uint8(columnFeatureMatrix(:, 1:c)), 'rows')));
		display(t);
		knnIndexes = knnsearch(columnFeatureMatrix, columnFeatureMatrix, 'K', 1000);
		for i=1:len*wid
				knnPoints = columnFeatureMatrix(knnIndexes(i, :), :);
				colorWeights = mvnpdf(knnPoints(:, 1:c), columnFeatureMatrix(i, 1:c), diagH1);
				distanceWeights = mvnpdf(knnPoints(:, c+1:c+2), columnFeatureMatrix(i, c+1:c+2), diagH2);

				finalWeights = colorWeights .* distanceWeights;

				subtractPoint = bsxfun(@minus, knnPoints, columnFeatureMatrix(i, :));

				gradientLogFunction = sum(bsxfun(@times, subtractPoint, finalWeights), 1) / sum(finalWeights);
				gradientLogFunction(1, 1:c) = gradientLogFunction(1, 1:c) * (-1.0/(h1*h1));
				gradientLogFunction(1, c+1:c+2) = gradientLogFunction(1, c+1:c+2) * (-1.0/(h2*h2));

				temporaryFeatureMatrix(i, :) = columnFeatureMatrix(i, :) + rate*gradientLogFunction;
		end
		columnFeatureMatrix = temporaryFeatureMatrix;
	end

	segmentedImage = reshape(uint8(columnFeatureMatrix), [len,wid, c+2]);
	segmentedImage = segmentedImage(:,:,1:c);
end
