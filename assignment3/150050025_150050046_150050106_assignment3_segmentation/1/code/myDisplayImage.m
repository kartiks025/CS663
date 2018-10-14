function myDisplayImage(img,title1)
    figure;
    imshow(img);
    colormap(jet(200));
    axis on;
    colorbar;
    title(title1);
end