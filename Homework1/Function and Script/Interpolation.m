% Interpolation : Nearest Neighbor, Bilinear

image = imread('../data/img_LR.png') ;
IMAGE = imread('../data/img_HR.png') ;

Result =  Nearest_Neighbor(image) ; 
imwrite(Result,'Result/Nearest_Neighbor.png') ;
computePSNR(Result,IMAGE);

Result2 = Bilinear(image);
imwrite(Result2,'Result/Bilinear.png') ;
computePSNR(IMAGE,Result2);
