%% function file for myLinearContrastStretching 
function contrastImg = myLinearContrastStretching(input)
   c = size(input,3);
   contrastImg = zeros(size(input));
   input = double(input);
   for l=1:c
       maxIntensity = max(max(input(:,:,l)));
       minIntensity = min(min(input(:,:,l)));
       contrastImg(:,:,l) = (input(:,:,l) - minIntensity) * double(255) / (maxIntensity - minIntensity);
   end
end
