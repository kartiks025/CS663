%% function file for myShrinkImageByFactorD 
%% window is always considered to be odd
function contrastImg = myAHE(input, window)
	[len,width,c] = size(input);
	constant1 = (window-1)/2;
	constant2 = (window+1)/2;

	paddedImg = double(-1*ones(len + window-1, width + window-1,c));
	paddedImg(constant2:len+constant1, constant2:width+constant1,:) = double(input);

% 	contrastImg = zeros(len,width,c);
% 	for i=constant2:(len+constant1)
% 		for j=constant2:(width+constant1)
% 			patch = paddedImg(i-constant1:i+constant1, j-constant1:j+constant1);
% 			if (i>=window && i<=(len-1) && j>=window && j<=(width-1))
% 				counts = imhist(patch);
% 			else
% 				counts = hist(patch, 257);
%               counts = counts(2:end);
% 			end
% 			cdf = cumsum(counts)/sum(counts);
% 			contrastImg(i-constant1, j-constant1,:) = round(cdf(paddedImg(i,j)+1)*255);
% 		end
% 	end
end
