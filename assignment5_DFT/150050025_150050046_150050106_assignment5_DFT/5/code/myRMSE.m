function rmse = myRMSE(denoised, original)
	sqSum1 = sum(sum((denoised - original).^2));
	sqSum2 = sum(sum(original.^2));
	rmse = sqrt(sqSum1/sqSum2);
end