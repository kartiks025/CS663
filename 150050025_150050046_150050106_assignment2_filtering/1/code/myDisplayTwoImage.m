function myDisplayTwoImage(img1,img2)
    figure('Position', [100, 100, 1200, 600]);
    subplot(1,2,1);
    myDisplayImageGrey(img1,"Original Image");
    subplot(1,2,2);
    myDisplayImageGrey(img2,"Sharpened Image");
end