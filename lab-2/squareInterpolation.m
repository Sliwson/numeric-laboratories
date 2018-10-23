function squareInterpolation(fun, n)
%SQUAREINTERPOLATION 

%siatka dla funkcji
step = 1/n;
[X,Y] = meshgrid(-1:step:1,-1:step:1);

[k,~] = size(X);
for i=1:k
    for j=1:k
        if(abs(X(i,j)) + abs(Y(i,j)) > 1)
            X(i,j) = NaN;
            Y(i,j) = NaN;
        end            
    end
end

for i=1:floor(k/2)
    even = false;
    length = i*2-1;
    offset = (k-length)/2;
    for j = 1+offset:k-offset
        if(even)
            %left
            T = [i,j-1,i,j,i+1,j]
            %right
            T = [i,j,i,j,i+1,j+1]
        else
            %left
            T = [i,j,i+1,j-1,i+1,j]
            %right
            T = [i,j,i+1,j,i+1,j+1]
        end
            
        even = ~even;  
    end
end

for i=ceil(k/2)+1:k
    even = false;
    length = (k-i+1)*2-1;
    offset = (k-length)/2;
    for j = 1+offset:k-offset
        if(even)
            %left
            T = [i,j-1,i,j,i-1,j]
            %right
            T = [i,j,i,j,i-1,j+1]
        else
            %left
            T = [i,j,i-1,j-1,i-1,j]
            %right
            T = [i,j,i-1,j,i-1,j+1]
        end
            
        even = ~even;  
    end
end

end

