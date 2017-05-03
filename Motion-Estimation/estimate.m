function [ ResidualImage, totalSAD ] = estimate( R, T, sizeofMacro, range, method, mode )

[M,N,C] = size(R);
position = zeros(1,2);
T_plum = zeros(M,N,C);
totalSAD = 0;

% Divides Target into non-overlaping macroblocks (two size -> 8x8 and 16x16)
for i=1:sizeofMacro:M
    for j=1:sizeofMacro:N
       
        position(1) = i;
        position(2) = j;
        
        Macroblock = DivideTarget2Macro(T, sizeofMacro, position);    
        
        % For each macroblock, "search" the reference frame in range [-p,p]
        % Then Find the minimum SAD (position:m,n) in that range in refernece frame.
        if(strcmp(mode,'one-direction'))
            
            [Replacedblock, SAD] = searchReference(R, Macroblock, position, range, method);
             T_plum( i:i+sizeofMacro-1, j:j+sizeofMacro-1 , :) = Replacedblock; 
        
        elseif(strcmp(mode,'bi-direction'))
            
             R2 = im2double(imread('data/frame85.jpg'));
            [Replacedblock1, SAD1] = searchReference(R , Macroblock, position, range, method);
            [Replacedblock2, SAD2] = searchReference(R2, Macroblock, position, range, method);       
            if SAD1<SAD2
               T_plum( i:i+sizeofMacro-1, j:j+sizeofMacro-1 , :) = Replacedblock1;
               SAD = SAD1;
            else
               T_plum( i:i+sizeofMacro-1, j:j+sizeofMacro-1 , :) = Replacedblock2;
               SAD = SAD2;
            end
            
        end
        totalSAD = totalSAD + SAD;
    end
end

computePSNR(T,T_plum);
ResidualImage = sum(abs(T_plum - T),3);


end

