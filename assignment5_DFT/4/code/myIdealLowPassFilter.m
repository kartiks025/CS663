function[] = myIdealLowPassFilter(img, cutoff_freq)
    [m,n] = size(img);
    padImg = padarray(img,[m/2,n/2]);
    fftImg = fftshift(fft2(padImg));
    logfftImg = log(abs(fftImg)+1);
    
    for u = 1:2*m
        for v = 1:2*n
            if ((u-m)^2 + (v-n)^2) > cutoff_freq^2
                fftImg(u,v) = 0;
            end
        end
    end
    
    infftImg = ifft2(ifftshift(fftImg));
    img = real(infftImg);
    img = img(m/2+1:m+m/2, n/2+1:n+n/2);
    figure;
    imagesc(mat2gray(img));
    colormap(gray);
    colorbar;
end