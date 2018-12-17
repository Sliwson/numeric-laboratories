function x = solveTridiagonal(v1, v2, v3, y)
%SOLVETRIDIAGONAL Rozwiazuje uklad rownan z macierza trojdiagonalna, gdzie
%v2 to daigonala glowna. Korzysta z algorytmu GEPP przystosowanego do macierzy trojdiagonalnych.
n = size(y,1);

if n == 1
    x = [y(1)/v2(1)];
    return;
end

v1 = [0,v1,0];
v3 = [v3,0,0];

x = zeros(n,1);
v0 = zeros(1,n+2);

%sprowadzenie do macierzy trojkatnej gornej
for i = 1:n-1        
    if abs(v2(i)) < abs(v3(i))
        tmp = v2(i);
        v2(i) = v3(i);
        v3(i) = tmp;
        
        tmp = v1(i+1);
        v1(i+1) = v2(i+1);
        v2(i+1) = tmp;
        
        if(i ~= n-1) 
            tmp = v0(i+2);
            v0(i+2) = v1(i+2);
            v1(i+2) = tmp;
        end
        
        tmp = y(i);
        y(i) = y(i+1);
        y(i+1) = tmp;
    end
    
    factor = v3(i)/v2(i);
    
    v3(i) = 0;
    v2(i+1) = v2(i+1) - factor * v1(i+1);
    v1(i+2) = v1(i+2) - factor * v0(i+2);
    y(i+1) = y(i+1) - factor * y(i);
end

%Obliczenie wektora wyjsciowego dla macierzy trojkatnej gornej
x(n) = y(n)/v2(n);
x(n-1) = (y(n-1)-v1(n)*x(n))/v2(n-1);

for i=n-2:-1:1
    x(i) = (y(i) - x(i+1)*v1(i+1) - x(i+2)*v0(i+2))/v2(i);
end

end

