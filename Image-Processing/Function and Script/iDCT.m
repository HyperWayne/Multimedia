function [ output ] = iDCT( image, mask )
% inverse Discrete Cosine Transform


I = im2double(image);

[h,w,c] = size(image);

% Divided image into blocks with 8-by-8 pixels per block.
% Supposed mask be T, T' is its transpose, then the result block would be:
% T * block * T'

for i=1:8:h
    for j=1:8:w
        for channel=1:3
            % Block of 8-by-8 pixels and will slide every 8i and 8j.
            block = I(i:i+7, j:j+7, channel);
            % result don't care what the color is, we already assign it.
            result = inv(mask) * block * inv(mask');
            % Let the result of block assign back to the desire output.
            I2(i:i+7, j:j+7, channel) = result;
       end
    end

end

%I2 = im2uint8(I2);

output = I2;


end

