function myDisplayImage(img, color, title1)
    figure
    if color
        imagesc(uint8(img));
        colormap(jet(200));
    else
        imagesc(mat2gray(img));
        colormap(gray(200));
    end
    daspect([1 1 1]);
	axis on;
    colorbar;
    title(title1);
    pause(3);
end