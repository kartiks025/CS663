function myDisplayImageGrey(img,title)
	myNumOfColors = 200;
	myColorScale = [ [0:1/(myNumOfColors-1):1], [0:1/(myNumOfColors-1):1], [0:1/(myNumOfColors-1):1] ];
	imagesc (single (phantom)); % phantom is a popular test image
	colormap (myColorScale);
	colormap grey;
	daspect ([1 1 1]);
	axis tight;
	colorbar