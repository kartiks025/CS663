function myDisplayImageGrey(img,title1)
	figure;
    imshow (mat2gray(img));
    title(title1);
	colormap(gray(200));
	axis on;
	colorbar;