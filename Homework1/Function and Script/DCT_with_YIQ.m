
% load image in
image = imread('../data/lalaland.png');

% image transformed to YIQ color model
YIQ_plum = YIQ(image);
imwrite(YIQ_plum,'Result/DCT_YIQ.png');

% DO the same process in (a)
[DCT_plum, mask] = DCT(YIQ_plum,2);
[DCT_Result] = iDCT(DCT_plum, mask);
% YIQ -> RGB
Reconstruct_image = iYIQ(DCT_Result);
imwrite(Reconstruct_image,'Result/DCT_YIQ_n_2.png');
computePSNR(image,Reconstruct_image);

[DCT_plum, mask] = DCT(YIQ_plum,4);
[DCT_Result] = iDCT(DCT_plum, mask);
% YIQ -> RGB
Reconstruct_image = iYIQ(DCT_Result);
imwrite(Reconstruct_image,'Result/DCT_YIQ_n_4.png');
computePSNR(image,Reconstruct_image);

[DCT_plum, mask] = DCT(YIQ_plum,8);
[DCT_Result] = iDCT(DCT_plum, mask);
% YIQ -> RGB
Reconstruct_image = iYIQ(DCT_Result);
imwrite(Reconstruct_image,'Result/DCT_YIQ_n_8.png');
computePSNR(image,Reconstruct_image);
