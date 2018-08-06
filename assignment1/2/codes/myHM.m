%% function file for myShrinkImageByFactorD 
function contrastImg = myHM(input,inputMask,inputRef,inputRefMask)
	[len,width,c] = size(input);
	
	contrastImg = zeros(len,width,c);
	for k=1:c   
	   
	   counts = imhist(input(:,:,k).*uint8(inputMask));
	   counts(1) = counts(1) - sum(inputMask(:)==0);
	   cdf = cumsum(counts)*1.0/sum(counts);
	   semiContrastImg = cdf(input(:,:,k)+1)*255;

	   countsRef = imhist(inputRef(:,:,k).*uint8(inputRefMask));
	   countsRef(1) = countsRef(1) - sum(inputRefMask(:)==0);
	   cdfRef = cumsum(countsRef)*1.0/sum(countsRef);
	   inverseCdf = quantile(cdfRef,0:(1.0/255):1);
	   inverseCdf

	   contrastImg(:,:,k) = inverseCdf(round(semiContrastImg)+1)*255;
	   contrastImg(:,:,k) = contrastImg(:,:,k).*inputMask;
	end
end

