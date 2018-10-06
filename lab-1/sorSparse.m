function x = sorSparse(A,b,w,xFirst, tolerance,maxIterations)
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

x = xFirst;
xnext = xFirst;

flag = 0;
iterations = 0;

while flag == 0
    for i = 1:n
        sum1=0;
        sum2=0;
        
        for j = rowBeginnings(i):rowBeginnings(i)+rowSplit(i)-1
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
    
    %checks 
    if norm(x - xnext) < tolerance
        flag = 1;
    end
    
    if iterations > maxIterations
        flag = 2;
    end
    
    iterations = iterations + 1;
    x = xnext;
end

if (flag == 2)
    error("The method is divergent");
end

end

