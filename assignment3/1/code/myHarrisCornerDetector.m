function resultHCD = myHarrisCornerDetector(inputImage, sigma, k, patch)

filterForGradient = fspecial('sobel');     
Ix = imfilter(inputImage, filterForGradient);           
Iy = imfilter(inputImage, filterForGradient');

wSize = patch/2;
windowFilter = fspecial('gaussian', 2*wSize+1, sigma);    
Ixx = imfilter(Ix.^2, windowFilter);
Iyy = imfilter(Iy.^2, windowFilter);
Ixy = imfilter(Ix.*Iy, windowFilter);
[hsize, vsize] = size(inputImage);
eigenValues = zeros([hsize vsize 2]);
resultHCD = zeros([hsize vsize]);

for i = 1:hsize
    for j = 1:vsize
        resultHCD(i,j) = det(Ixx(i,j).*Iyy(i, j) - Ixy(i,j).^2) - k*(Ixx(i,j)+Iyy(i, j)).^2;        
        eigenValues(i,j,:) = eig([Ixx(i,j) Ixy(i,j); Ixy(i, j) Iyy(i, j)])';	
    end		
end

figure,imshow(reScale(Ix));
title('Y Derivative');
figure,imshow(reScale(Iy));
title('X Derivative');
myDisplayImage(reScale(eigenValues(:,:,1)),'EigenValue 1');
myDisplayImage(reScale(eigenValues(:,:,2)),'EigenValue 2');
myDisplayImage(resultHCD,'Cornerness Measure');
end

