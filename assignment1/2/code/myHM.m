%% function file for myShrinkImageByFactorD 
function contrastImg = myHM(input,inputMask,inputRef,inputRefMask)
	[len,width,c] = size(input);
	
	contrastImg = zeros(len,width,c);
    % Doing the process for each channel
	for k=1:c 
	   % Finding the cdf for input image
	   counts = imhist(input(:,:,k).*uint8(inputMask));
       % Removing the zeros introduced by the binary mask
	   counts(1) = counts(1) - sum(inputMask(:)==0);
	   cdf = cumsum(counts)*1.0/sum(counts);
       % Applying cdf on the input image
	   semiContrastImg = cdf(input(:,:,k)+1)*255;

       % Finding the cdf for reference image
	   countsRef = imhist(inputRef(:,:,k).*uint8(inputRefMask));
	   countsRef(1) = countsRef(1) - sum(inputRefMask(:)==0);
	   cdfRef = cumsum(countsRef)*1.0/sum(countsRef);
       % Computing the inverse of the cdf of refernce image
	   inverseCdf = quantile(cdfRef,0:(1.0/255):1);

       % Applying the inverse cdf on the equalized image
	   contrastImg(:,:,k) = inverseCdf(round(semiContrastImg)+1)*255;
	   contrastImg(:,:,k) = contrastImg(:,:,k).*inputMask;
	end
end

