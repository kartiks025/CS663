function[] = myGaussianLowPassFilter(img, sigma)
    [m,n] = size(img);
    padImg = padarray(img,[m/2,n/2]);
    fftImg = fftshift(fft2(padImg));
    logfftImg = log(abs(fftImg)+1);
    
    for u = 1:2*m
        for v = 1:2*n
            g = exp(-1*((u-m)^2 + (v-n)^2)/(2*sigma^2));
            fftImg(u,v) = fftImg(u,v)*g;
            logfftImg(u,v) = logfftImg(u,v)*g;
        end
    end
    
    infftImg = ifft2(ifftshift(fftImg));
    img = real(infftImg);
    img = img(m/2+1:m+m/2, n/2+1:n+n/2);
    myDisplayImage(logfftImg, true, ['Frequency response of gaussian low pass filter with cutoff frequency = ' num2str(sigma)]);
    myDisplayImage(img, false, ['Image with gaussian low pass filter with sigma = ' num2str(sigma)]);
end