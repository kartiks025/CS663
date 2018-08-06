function enlargedImg = myBilinearInterpolation(input)
   [len,wid] = size(input);
   len = 3 * len - 2;
   wid = 2 * wid - 1;
   enlargedImg = zeros(len,wid);
   enlargedImg(1:3:len,1:2:wid) = input;
   %length interpolation
   enlargedImg(2:3:len-2,1:2:wid) = (enlargedImg(1:3:len-3,1:2:wid)*2 + enlargedImg(4:3:len,1:2:wid))/3;
   enlargedImg(3:3:len-1,1:2:wid) = (enlargedImg(1:3:len-3,1:2:wid) + enlargedImg(4:3:len,1:2:wid)*2)/3;
   %width interpolation
   enlargedImg(1:1:len,2:2:wid-1) = (enlargedImg(1:1:len,1:2:wid-2) + enlargedImg(1:1:len,3:2:wid))/2;
end
