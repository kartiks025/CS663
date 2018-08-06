function shrinkImg = myShrinkImageByFactorD(input, dim)
   [len,wid] = size(input);
   shrinkImg = input(1:dim:len,1:dim:wid);
end