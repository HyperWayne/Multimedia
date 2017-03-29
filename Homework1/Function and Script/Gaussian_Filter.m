function [ output ] = Gaussian_Filter( image, kernel)


[h, w] = size(image);
[mh, mw] = size(kernel);
I = im2double(image);
Kernel = im2double(kernel);
% Window size
M = (mh-1)/2;
N = (mw-1)/2;
% Initialize
output=zeros(size(I));
% Pad the vector with zeros
I = padarray(I,[M N]);
% Convolution
for i = 1:h
    for j = 1:w
        Temp = I(i:i+2*M,j:j+2*N).* Kernel;
        output(i,j)=sum(Temp(:));
    end
end


end

