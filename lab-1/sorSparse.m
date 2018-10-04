function x = sorSparse(A,b,w)
%SORSPARSE Summary of this function goes here
%   Detailed explanation goes here

[n, ~] = size(b);

%check diagonal elements
diagonal = zeros(1,n);

[~, k] = size(A);

for a = 1:k
    if A(1,a) == A(2,a)
        diagonal(A(1,a)) = A(3,a);
    end
end

if(any(diagonal == 0))
    error("Diagonal element could not equal 0!");
end

%here we know that we have at least one nonzero element in each row    
rowSplit = zeros(1,n);
rowBeginnings = zeros(1,n);

for a = 1:k
    rowSplit(A(1,a)) = rowSplit(A(1,a)) + 1;
end

rowBeginnings(1) = 1;
for a = 2:n
    rowBeginnings(a) = rowBeginnings(a-1)+rowSplit(a-1);
end

x = ones(n,1);
xnext = ones(n,1);

for k = 1:100
    for i = 1:n
        sum1=0;
        sum2=0;
        
        for j = rowBeginnings(i):rowBeginnings(i)+rowSplit(i)
            column = A(2,j);
            value = A(3,j);
            
            if(column < i)
                sum1 = sum1 + value*xnext(column);
            elseif (column > i)
                sum2 = sum2 + value*x(column);
            end
        end
        
        xnext(i) = (1-w)*x(i) + w/diagonal(i)*(b(i)- sum1 - sum2);
    end
    
    x = xnext;
end

end

