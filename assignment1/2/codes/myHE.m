%% function file for myShrinkImageByFactorD 
function contrastImg = myHE(input)
   counts = imhist(input);
   cdf = cumsum(counts)/sum(counts);
   contrastImg = cdf(input+1)*255;
end
