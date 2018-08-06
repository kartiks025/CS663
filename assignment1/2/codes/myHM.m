function contrastImg = myHM(input,inputRef)
   counts = imhist(input);
   cdf = cumsum(counts)/sum(counts);
   semiContrastImg = cdf(input+1)*255;
   countsRef = imhist(inputRef);
   cdfRef = cumsum(countsRef)/sum(countsRef);
   inverseCdf = quantile(cdfRef,256)*255;
   contrastImg = inverseCdf(round(semiContrastImg)+1);
end

