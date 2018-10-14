%% Mean Shift Segmentation
function segmentedImage = myMeanShiftSegmentation(img, h1, h2, rate)
	[len, wid, c] = size(img);

	colorMatrix(:,:,:) = double(img);

	% Preparing the distance feature
	distanceMatrix(:,:,1) = double(repmat((1:wid), len, 1));
	distanceMatrix(:,:,2) = double(repmat((1:len)', 1, wid));

	% featureMatrix is len * wid * 5 dimensional matrix, with 1:3 channels being of color
	% 4:5 channels being for distance
	featureMatrix(:,:,1:c) = colorMatrix;
	featureMatrix(:,:,c+1:c+2) = distanceMatrix;

	% Flattening out the featureMatrix to shape (len * wid) * 5
	columnFeatureMatrix = reshape(featureMatrix, len*wid, c+2);

	% Storing the gradients of the points
	gradientMatrix = zeros(size(columnFeatureMatrix));

	diagH1 = diag(h1*ones(c, 1));
	diagH2 = diag(h2*ones(2, 1));

	for t=1:15
		% Finding the nearest neighbours over which the gradient would be computed
		knnIndexes = knnsearch(columnFeatureMatrix, columnFeatureMatrix, 'K', 1500);
		for i=1:len*wid
				knnPoints = columnFeatureMatrix(knnIndexes(i, :), :);
				colorWeights = mvnpdf(knnPoints(:, 1:c), columnFeatureMatrix(i, 1:c), diagH1);
				distanceWeights = mvnpdf(knnPoints(:, c+1:c+2), columnFeatureMatrix(i, c+1:c+2), diagH2);

				finalWeights = colorWeights .* distanceWeights;

				meanPoints = sum(bsxfun(@times, knnPoints, finalWeights), 1) / sum(finalWeights);
				gradientMatrix(i, :) = meanPoints;
		end
		% Gradient ascent 
		columnFeatureMatrix = columnFeatureMatrix*(1-rate) + rate*gradientMatrix;
	end
	segmentedImage = reshape(uint8(columnFeatureMatrix), [len, wid, c+2]);
	segmentedImage = segmentedImage(:,:, 1:c);
end
