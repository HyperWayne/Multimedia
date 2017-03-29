function [ output, mask ] = DCT( image, n )
% Discrete Cosine Transform

[h, w, c] = size(image);

I = im2double(image);

% keep the lower-frequency , upper-left n-by-n, coefficients in the 2D
% DCT domain by setting the remaining coefficients to zero

mask = zeros(8,8);

for i=1:8
    for j=1:8
        if (i == 1)
            mask(i,j) =  1 / sqrt(8) ;
        else 
            mask(i,j) = cos(pi * (2*(j-1) +1) * (i-1)/16) * sqrt(2/8) ;
        end
    end
end


% Divided image into blocks with 8-by-8 pixels per block.
% Supposed mask be T, T' is its transpose, then the result block would be:
% T * block * T'

Result = zeros(8,8);


for i=1:8:h
    for j=1:8:w
        for channel=1:c  % Deal with R , G , B, respectively.
            
            % Block of 8-by-8 pixels and will slide every 8i and 8j.
             block = I(i:i+7, j:j+7, channel);
            
            % result don't care what the color is, we already assign it.
            result = mask * block * mask';
            
            % setting the remaining coefficients to zero

            for k = n+1:8 
               for l = 1+n:8
                  result(k,l) = 0;  
               end
            end
            
            I2(i:i+7, j:j+7, channel) = result;

       end
    end

end


output = I2;

end
