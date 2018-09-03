function output = reScale(inputImage)
    minVal = min(min(inputImage));
    maxVal = max(max(inputImage));
    output = (double(inputImage)-minVal)/(maxVal-minVal);
end

