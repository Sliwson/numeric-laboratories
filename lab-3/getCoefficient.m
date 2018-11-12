function coeff = getCoefficient(x,y,n,m)
%GETCOEFFICIENT Summary of this function goes here
%   Detailed explanation goes here
if (x == 1 || x == n+1)
    if(y == 1 || y==m+1)
        coeff = 1;
    else
        coeff = 2;
    end
elseif (y == 1 || y == m+1)
    coeff = 2;        
else
    coeff = 4;
end
    
end

