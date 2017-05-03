function [ Macroblock ] = DivideTarget2Macro( TargetImage , Size, Position)

% TargetImage:image denotes the frame that are to be divided
% Position:Vector   denotes the upper-left of the macroblock, (1):x, (2):y
% Size:integer      denotes the size of Macroblock, e.g, 8x8, 16x16
% Return:image      8x8 or 16x16 macroblock

[M,N,C] = size(TargetImage);

Macroblock = zeros(Size,Size,C);
     
m = Position(1); 
n = Position(2);
            
%if( (m>=1) && (n>=1) && (m+Size<M) && (n+Size<N) )
  
 Macroblock = TargetImage(m:m+Size-1, n:n+Size-1,:);

%end

end

