% DCT script, including dct and inverse dct, output the processed image.
image = imread('../data/lalaland.png');

% Reconstruct the image by taking inverse 2D DCT with the modified DCT coefficients for each block.
[DCT_plum, mask]= DCT(image, 2);
[DCT_Result] = iDCT(DCT_plum, mask);
imwrite(DCT_plum,'Result/DCT_n_2.png');
imwrite(DCT_Result,'Result/iDCT_n_2.png');
computePSNR(image,DCT_Result);

% for n=4
[DCT_plum, mask]= DCT(image, 4);
[DCT_Result] = iDCT(DCT_plum, mask);
imwrite(DCT_plum,'Result/DCT_n_4.png');
imwrite(DCT_Result,'Result/iDCT_n_4.png');
computePSNR(image,DCT_Result);


%for n=8
[DCT_plum, mask] = DCT(image, 8);
[DCT_Result] = iDCT(DCT_plum, mask);
imwrite(DCT_plum,'Result/DCT_n_8.png');
imwrite(DCT_Result,'Result/iDCT_n_8.png');
computePSNR(image,DCT_Result);
