function x = sorSparse(A,b,w)
%SORSPARSE Summary of this function goes here
%   Detailed explanation goes here

[n, ~] = size(b);

%check diagonal elements
diagonal = zeros(1,n);

[~, i] = size(A);

for a = 1:i
    if A(1,a) == A(2,a)
        diagonal(A(1,a)) = A(3,a);
    end
end

if(any(diagonal == 0))
    error("Diagonal element could not equal 0!");

x = ones(n,1);
xnext = ones(n,1);

for k = 1:10
    for i = 1:10
        %xnext(i) = (1-w)*x(i) + w/
    end
end

end

