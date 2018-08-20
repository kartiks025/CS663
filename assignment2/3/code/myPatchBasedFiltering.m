function filterImg = myPatchBasedFiltering(img, patchSize, windowSize, h)
	[len, wid, c] = size(img);
	borderCopy = padarray(img, (windowSize-1)/2, 'symmetric', 'both');
	filterImg = borderCopy;  
end