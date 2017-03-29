function [ output ] = Median_Filter( image, sizes)


[h, w] = size(image);
I = im2double(image);
% Window size
M = (sizes-1)/2;
% Initialize
output=zeros(size(I));
% Pad the vector with zeros
I = padarray(I,[M M]);
% Median
for i = 1:h
    for j = 1:w
        Temp = I(i:i+2*M,j:j+2*M);
        output(i,j)=median(Temp(:));
    end
end


end

