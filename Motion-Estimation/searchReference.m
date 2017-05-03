function [ Block, SAD ] = searchReference(R, Macro, P, range, method)

% R:image       denotes the reference frame
% Macro:image   denotes the Macorblock
% p:vector      denotes the starting position for searching
% range:integer denotes the range that search, e.g, [-8,8] 
% method:string denotes the method that used to search

SAD = 0;
Min = realmax;

[M,N,Z] = size(R);

[A,B,C] = size(Macro);

MotionVector = zeros(1,2);
% Best_Macro indicates the macroblock that have minimum SAD
Best_Macro = zeros(1,2);


if(strcmp(method,'full-search')==1)

    for p=-range:range
        for q=-range:range
            % m,m denotes the upper-left of the block that been compared
            m = p+P(1); 
            n = q+P(2);
            % if the starting position is out of bound
            % Skip this comparison
            if( (m>=1 ) && (n>=1) && (m+A-1<=M) && (n+B-1<=N) )
                % caculate the SAD for each block
                    SAD = sum(sum(sum(abs( Macro - R(m:m+A-1, n:n+B-1,:)))));
                    % record the minimum SAD and its corresponding positon
                    if(SAD < Min) 
                        Min = SAD; 
                      %  MotionVector(1) = (p);
                      %  MotionVector(2) = (q);
                        Best_Macro(1)   = m;
                        Best_Macro(2)   = n;
                    end 
            end
            
        end
    end
    
    % Get the minimum block after search
    Block = R( Best_Macro(1):Best_Macro(1)+A-1, Best_Macro(2):Best_Macro(2)+B-1, : );

    
elseif(strcmp(method,'2D-log-search')==1)
    
    % Initial the logarithm search
    searchRange = floor(log2(range));
    searchRange = max(2,2^(searchRange-1));
    % Upper-Left of the macroblock
    m = P(1); 
    n = P(2);
    % Start Log search
    while (searchRange ~= 1)
        
        % Check the original border : center check
        if( (m>=1 ) && (n>=1) && (m+A-1<=M) && (n+B-1<=N))
            % Assume minimum is in "Center"
            center = 1;
            
            % Center SAD
         
            SAD = sum(sum(sum(abs( Macro - R(m:m+A-1, n:n+B-1,:)))));
                if(SAD < Min)
                    Min = SAD; 
                    Best_Macro(1)   = m;
                    Best_Macro(2)   = n;
                end      
     
            % Right SAD
            if( (m+A+searchRange-1<= P(1)+range+A ) && (m+A+searchRange-1<=M) )      
                SAD = sum(sum(sum(abs( Macro - R(m+searchRange:m+A+searchRange-1, n:n+B-1,:)))));
                if(SAD < Min)
                    Min = SAD; 
                    Best_Macro(1)   = m+searchRange;
                    Best_Macro(2)   = n;
                    center = 0;
                end 
            end
            
            % Left SAD
            if( (m-searchRange>= P(1)-range) && (m-searchRange>=1) ) 
                SAD = sum(sum(sum(abs( Macro - R(m-searchRange:m+A-1-searchRange, n:n+B-1,:)))));
                if(SAD < Min)
                    Min = SAD; 
                    Best_Macro(1)   = m-searchRange;
                    Best_Macro(2)   = n;
                    center = 0;
                end 
            end
            % Bottom SAD
            if( (n+B+searchRange-1<= P(2)+range+B ) && (n+B+searchRange-1<=N) ) 
                SAD = sum(sum(sum(abs( Macro - R(m:m+A-1, n+searchRange:n+B-1+searchRange,:)))));
                if(SAD < Min)
                    Min = SAD; 
                    Best_Macro(1)   = m;
                    Best_Macro(2)   = n+searchRange;             
                    center = 0;
                end 
            end
            
            % Top SAD
            if( (n-searchRange>= P(2)-range ) &&  (n-searchRange>=1) )           
                SAD = sum(sum(sum(abs( Macro - R(m:m+A-1, n-searchRange:n+B-1-searchRange,:)))));
                if(SAD < Min)
                    Min = SAD; 
                    Best_Macro(1)   = m;
                    Best_Macro(2)   = n-searchRange;          
                    center = 0;
                end 
            end
            
            if (center==1)
                searchRange = searchRange / 2 ;
            end
            
             % Record the best Upper-left position in that step
             m = Best_Macro(1); 
             n = Best_Macro(2);
         
        else
            break;
        end 
        
    end
    
    for i=-1:1
        for j=-1:1
            if( (m+i>=1 ) && (n+j>=1) && (m+A+i-1<=M) && (n+B+j-1<=N) )
               SAD = sum(sum(sum(abs( Macro - R(m+i:m+A+i-1, n+j:n+B+j-1,:)))));
            end
            if(SAD < Min)
                Min = SAD;
                Best_Macro(1)   = m+i;
                Best_Macro(2)   = n+j;
            end
        end
    end
    
    Block = R( Best_Macro(1):Best_Macro(1)+A-1, Best_Macro(2):Best_Macro(2)+B-1, : );
    
end
 
SAD = Min;

end

