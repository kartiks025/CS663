function contrastImg = myHE(input)
   [len,width,c] = size(input);

   contrastImg = zeros(len,width,c);
    for k=1:c
	    counts = imhist(input(:,:,k));
   		cdf = cumsum(counts)/sum(counts);
   		contrastImg(:,:,k) = cdf(input(:,:,k)+1)*255;
    end
end
