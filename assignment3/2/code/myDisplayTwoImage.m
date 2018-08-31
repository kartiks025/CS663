function myDisplayTwoImage(img1,img2)
    figure('Position', [100, 100, 1200, 600]);
    subplot(1,2,1);
    myDisplayImageColor(img1,'Original Image');
    subplot(1,2,2);
    myDisplayImageColor(img2,'Segmented Image');
end