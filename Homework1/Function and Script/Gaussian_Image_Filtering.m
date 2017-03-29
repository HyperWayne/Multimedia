% Image Filtering : Gaussian filter

image = imread('../data/thinker_gray_noised.jpg');

% fspecial returns a rotationally symmetric Gaussian lowpass filter of size hsize with standard deviation sigma (positive).
% hsize can be a vector specifying the number of rows and columns in h, 
% or it can be a scalar, in which case h is a square matrix.
% e.g. H = fspecial('gaussian', hsize, sigma);

h1 = fspecial('gaussian', 3, 0.3);
h2 = fspecial('gaussian', 9, 1.0);

Result_G =  Gaussian_Filter(image , h2) ;

%imshow(Result_G);

Result_M = Median_Filter(image, 9);

imshow(Result_M);