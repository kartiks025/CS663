% window is always considered to be odd
function contrastImg = myAHE(input, window)
	[len,width,c] = size(input);
	constant1 = (window-1)/2;
	constant2 = (window+1)/2;

	contrastImg = zeros(len,width,c);
	for k=1:c
		for i=1:len
			for j=1:width
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
				elseif j > (width-constant1)
					maxJ = width;	 
				end
				% when the patch is inside
				patch = input(minI:maxI, minJ:maxJ,k);
				counts = hist(double(patch(:)), 0:1:255);
				cdf = cumsum(counts)/sum(counts);
				contrastImg(i,j,k) = round(cdf(input(i,j,k)+1)*255);
			end
		end
	end
end
