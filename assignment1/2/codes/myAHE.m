%% function file for myShrinkImageByFactorD 
function contrastImg = myAHE(input)
   [len,wid] = size(input);
   
   counts = imhist(input);
   cdf = cumsum(counts)/sum(counts);
   contrastImg = cdf(input+1)*255;
end
