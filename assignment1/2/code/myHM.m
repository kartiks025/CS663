%% function file for myShrinkImageByFactorD 
function contrastImg = myHM(myInput,myInputMask,myInputRef,myInputRefMask)
	[len,mywidth,c] = size(myInput);
	
	contrastImg = zeros(len,mywidth,c);
    % Doing the process for each channel
	for k=1:c 
	   % Finding the mycdf for myInput image
	   counts = imhist(myInput(:,:,k).*uint8(myInputMask));
       % Removing the zeros introduced by the binary mask
	   counts(1) = counts(1) - sum(myInputMask(:)==0);
	   mycdf = cumsum(counts)*1.0/sum(counts);
       % Applying mycdf on the myInput image

       N = 1000;
	   semiContrastImg = round(mycdf(myInput(:,:,k)+1)*N);

       % Finding the mycdf for reference image
	   countsRef = imhist(myInputRef(:,:,k).*uint8(myInputRefMask));
	   countsRef(1) = countsRef(1) - sum(myInputRefMask(:)==0);
	   size(countsRef)
	   mycdfRef = cumsum(countsRef)*1.0/sum(countsRef);
       % Computing the inverse of the mycdf of refernce image
% 	   inversemyCdf = quantile(countsRef,0:(1.0/N):1);
        
       inversemyCdf = zeros(N+1);
       ind = 1;
       for val=0:N
           while ind ~= 257
              if(mycdfRef(ind)>=val*1.0/N)
                  inversemyCdf(val+1) = ind;
                  break;
              end
              ind = ind+1;
           end
       end

       % Applying the inverse mycdf on the equalized image
	   contrastImg(:,:,k) = inversemyCdf(semiContrastImg+1);
 	   contrastImg(:,:,k) = contrastImg(:,:,k).*myInputMask;
	end
end

