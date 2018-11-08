function [B, err] =  squareInterpolation(fun, n)
%SQUAREINTERPOLATION funkcja interpoluje funkcje dwoch zmiennych fun, na obszarze
%|x|+|y| <= 0 podzielonym na 4*n*n trojkatow przystajacych.
%Parametry wejsciowe:
%   fun - funkcja dwoch zmiennych
%   n - parametr podzialu obszaru
%Parametry wyjsciowe:
%   B - Tablica, ktorej kazdy wiersz zawiera odpowiednio: wspolrzedne x oraz y
%   srodka ciezkosci trojkata, wartosc funkcji w tym punkcie, wartosc
%   przyblizenia w tym punkcie, blad w tym punkcie.
%   err - maksymalny blad

%siatka dla funkcji
step = 1/n;
[X,Y] = meshgrid(-1:step:1,1:-step:-1);

A = zeros(4*n*n, 12); %kazdy wiersz zawiera x1,y1,x2,y2,x3,y3,oraz srodki bokow
B = zeros(4*n*n, 5); %wektor wynikowy - wspolrzedne srodka ciezkosci, wartosc funkcji, przyblizenia oraz blad.

[k,~] = size(X);

%petla wyznaczajaca podzial obszaru na trojkaty
counter = 1;
for i=1:floor(k/2)
    length = i*2-1;
    offset = (k-length)/2;
    
    for j = 1+offset:ceil(k/2)
        %left
        T = [i,j,i+1,j-1,i+1,j];
        A(counter,:) = initializeAfromT(T,X,Y);
        counter = counter + 1;
        
        if(j ~= 1+offset)
            %left
            T = [i,j,i,j-1,i+1,j];
            A(counter,:) = initializeAfromT(T,X,Y);
            counter = counter + 1;
        end
    end
end

%odbicie w poziomie
for i = 1:n*n
    newIndex = i+n*n;
    A(newIndex,:) = A(i,:);
    
    j = 1:2:11;
    A(newIndex,j) = A(newIndex,j).*-1;
end

%odbicie w pionie
for i = 1:2*n*n
    newIndex = i+2*n*n;
    A(newIndex,:) = A(i,:);
    
    j = 2:2:12;
    A(newIndex,j) = A(newIndex,j).*-1;
end

for i=1:4*n*n
    %srodek ciezkosci trojkata
    x = (A(i,1) + A(i,3) + A(i,5))/3;
    y = (A(i,2) + A(i,4) + A(i,6))/3;
    
    B(i,1) = x;
    B(i,2) = y; 
    B(i,3) = fun(x,y);
    
    %wyznaczenie macierzy, dzieki ktorej obliczymy wspolczynniki
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
    B(i,5) = fApprox - B(i,3);
end

err = max(abs(B(:,5)));
end

