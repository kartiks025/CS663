function filteredImage = myBilateralFiltering(input, sigmaSpace, sigmaIntensity,windowSize)
    
    % create pre defined filter gaussian space
    filter = fspecial('gaussian',2*windowSize+1 ,sigmaSpace);
    [len,wid] = size(input);
    filteredImage = zeros([len,wid]);
    for i = 1:len
        for j = 1:wid
            x = max(i-windowSize,1);
            X = min(i+windowSize,len);
            y = max(j-windowSize,1);
            Y = min(j+windowSize,wid);
            window = input(x:X,y:Y);
            x1 = max(2+windowSize-i,1);
            X1 = min(2*windowSize+1,len-i+windowSize+1);
            y1 = max(2+windowSize-j,1);
            Y1 = min(2*windowSize+1,wid-j+windowSize+1);
            intensity = exp(-((window-input(i,j)).^2)/(sigmaIntensity^2));
            singleTerm = filter((x1:X1),(y1:Y1)).*intensity;
            individualSum = window.*singleTerm;
            filteredImage(i,j) = sum(individualSum(:))/sum(singleTerm(:));
        end
    end
end
