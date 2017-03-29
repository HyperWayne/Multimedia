function [ output ] = iYIQ( image )
% from YIQ space to RGB space
% YIQ -> RGB inverse the matrix

[h, w, c] = size(image);

output = zeros(h,w,c);

I = im2double(image);

f = [0.229  0.587  0.114 ; 
     0.596 -0.275 -0.321 ;
     0.212 -0.523  0.311];

for i = 1 : h
    for j = 1 : w
        yiq = I (i, j, :) ;
        yiq = reshape(yiq, 3, 1);  
        yiq = inv(f) * yiq ;
        output(i, j, :) = yiq; 
    end
end
   
end

