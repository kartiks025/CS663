function rsmdVal = myRsmd(img1,img2)
    [len, wid] = size(img1);
    rsmdVal = sqrt(sum(sum((img1-img2).^2))/(len*wid));
end