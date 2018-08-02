%% function file for myShrinkImageByFactorD 
function contrastImg = myLinearContrastStretching(input)
   input = double(input);
   maxIntensity = max(max(input));
   minIntensity = min(min(input));
   contrastImg = (input - minIntensity) * 255 / (maxIntensity - minIntensity);
end
