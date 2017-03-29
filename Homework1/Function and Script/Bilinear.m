function [ output ] = Bilinear( image )

   [m,n,c] = size(image);
   scalingFactor = 4;
   
        M = floor(m*scalingFactor);   % M is the pixel after scaling , so does N.
        N = floor(n*scalingFactor);           
            for i = 1:M
                x1 = floor(i/scalingFactor); % x1 indicates new row pixel at top-left
                x2 = ceil(i/scalingFactor);  % x2 indicates new row pixel at top-right
                    if( x1 == 0 ) % In case floor(0.xx) = 0
                        x1 = 1; 
                    end
                    x = rem(i/scalingFactor,1); % x indicates new row pixel                    
                for j = 1:N                 
                    y1 = floor(j/scalingFactor); % y1 indicates new col pixel at bottom-left
                    y2 = ceil(j/scalingFactor);  % y2 indicates new col pixel at bottom-right
                        if(  y1 == 0 ) % In case floor(0.xx) = 0
                        y1 = 1;  
                        end
                    y = rem(j/scalingFactor,1);   % y1 indicates new col pixel               
                    f00 = image(x1,y1,:) ;  
                    f01 = image(x2,y1,:) ;
                    f10 = image(x1,y2,:) ;
                    f11 = image(x2,y2,:) ;                           
                    % Do interpolation, the order isn't important at all               
                    T = (f10 * y) + (f00 * (1-y)); 
                    B = (f11 * y) + (f01 * (1-y));
                    
                    output(i,j,:) = (B * x) + (T * (1-x));

                 end
            end
     


end

