function[] = myNotchFilter(fftImg, u1, v1, thresh)
    [m,n] = size(fftImg);
    m = m/2;
    n = n/2;
    for u = 1:m
        for v = 1:n
            for i = 1:2
                if ((u-u1(i))^2 + (v-v1(i))^2) <= thresh
                    fftImg(u+m/2,v+n/2) = 0;
                end
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
    
                
            