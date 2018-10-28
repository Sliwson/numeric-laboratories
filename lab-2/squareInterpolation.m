function squareInterpolation(fun, n)
%SQUAREINTERPOLATION 

%siatka dla funkcji
step = 1/n;
[X,Y] = meshgrid(-1:step:1,1:-step:-1);
A = zeros(4*n*n, 12); %kazdy wiersz zawiera x1,y1,x2,y2,x3,y3,oraz srodki bokow
B = zeros(4*n*n, 5); %wektor wynikowy - wspolrzedne srodka ciezkosci, wartosc funkcji, przyblizenia oraz blad.

[k,~] = size(X);

counter = 1;
for i=1:floor(k/2)
    even = false;
    length = i*2-1;
    offset = (k-length)/2;
    for j = 1+offset:k-offset
        if(even)
            %left
            T = [i,j-1,i,j,i+1,j];
            A(counter,:) = initializeAfromT(T,X,Y);
            counter = counter + 1;
            %right
            T = [i,j,i,j,i+1,j+1];
            A(counter,:) = initializeAfromT(T,X,Y);
        else
            %left
            T = [i,j,i+1,j-1,i+1,j];
            A(counter,:) = initializeAfromT(T,X,Y);
            counter = counter + 1;
            %right
            T = [i,j,i+1,j,i+1,j+1];
            A(counter,:) = initializeAfromT(T,X,Y);
        end
            
        counter = counter + 1;
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
            T = [i,j-1,i,j,i-1,j];
            A(counter,:) = initializeAfromT(T,X,Y);
            counter = counter + 1;
            %right
            T = [i,j,i,j,i-1,j+1];
            A(counter,:) = initializeAfromT(T,X,Y);
        else
            %left
            T = [i,j,i-1,j-1,i-1,j];
            A(counter,:) = initializeAfromT(T,X,Y);
            counter = counter + 1;
            %right
            T = [i,j,i-1,j,i-1,j+1];
            A(counter,:) = initializeAfromT(T,X,Y);
        end
            
        counter = counter + 1;
        even = ~even;  
    end
end

for i=1:4*n*n
    %srodek ciezkosci
    x = (A(i,1) + A(i,3) + A(i,5))/3;
    y = (A(i,2) + A(i,4) + A(i,6))/3;
    
    B(i,1) = x;
    B(i,2) = y; 
    B(i,3) = fun(x,y);
    
    b = zeros(6,1);
    M = zeros(6,6);
    
    for j=1:6
        xj = A(i,2*j-1);
        yj = A(i,2*j);
        
        b(j) = fun(xj, yj);
       
        M(j,:) = [1, xj, yj, xj*yj, xj*xj, yj*yj]; 
    end
    
    c = M\b;
    
    fApprox = c(1) + c(2)*x + c(3)*y + c(4)*x*y + c(5)*x*x + c(6)*y*y;
    B(i,4) = fApprox;
    B(i,5) = abs(fApprox - B(i,3));
end

disp(B);
end

