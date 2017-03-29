% Image Filtering : Gaussian filter

image = imread('../data/thinker_gray_noised.jpg');

% fspecial returns a rotationally symmetric Gaussian lowpass filter of size hsize with standard deviation sigma (positive).
% hsize can be a vector specifying the number of rows and columns in h, 
% or it can be a scalar, in which case h is a square matrix.
% e.g. H = fspecial('gaussian', hsize, sigma);

h1 = fspecial('gaussian', 3, 0.3);
h2 = fspecial('gaussian', 9, 1.0);

Result_G1 =  Gaussian_Filter(image , h1) ;
Result_G2 =  Gaussian_Filter(image , h2) ;

imwrite(Result_G1,'Result/Gaussian_3_3_03.jpg');
imwrite(Result_G2,'Result/Gaussian_9_9.10.jpg');

Result_M1 = Median_Filter(image, 3);
imwrite(Result_M1,'Result/Median_3_3.jpg');
Result_M2 = Median_Filter(image, 9);
imwrite(Result_M2,'Result/Median_9_9.jpg');
