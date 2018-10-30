function[fftImg] = logFourier(img)
    [m,n] = size(img);
    padImg = padarray(img,[m/2,n/2]);
    fftImg = fftshift(fft2(padImg));
    logfftImg = log(abs(fftImg)+1);
    figure;
    imagesc(mat2gray(logfftImg));
    title('')
    colormap(gray);
    colorbar;
end
    