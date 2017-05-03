function psnr = computePSNR(I1 , I2)

[h,w,c] =  size(I1) ;


I1 = im2double(I1) ;
I2 = im2double(I2) ;

for channel=1:c
   MSE(channel) = sum(sum((I1(:,:,channel) - I2(:,:,channel)).^2)) / h / w;
end

MSE = mean(MSE);

psnr = 10 * log10(1 / MSE);

disp(psnr) ;

end