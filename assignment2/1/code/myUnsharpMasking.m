function fiteredImage = myUnsharpMasking(input, sigma, windowSize, scale)
    fiteredImage = input - scale*imfilter(input,fspecial('log',windowSize,sigma));
end