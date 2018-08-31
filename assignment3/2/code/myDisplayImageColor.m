function myDisplayImageGrey(img,title1)
    imshow (uint8(img));
    title(title1);
	colormap(jet(200));
	axis on;
	colorbar;