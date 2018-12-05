function [fApprox, tab] = lsf2(f,n,a,b,c,d)
%lsfApproximation Przybliza funkcje f wzorami empirycznymi w bazie
%1,x,y,x^2y^2, tak aby zminimalizowac blad kwadratowy. Przyblizenie
%wykonujemy na n losowych punktach z prostokata [a,b]x[c,d].
%   f - uchwyt do funkcji dwoch zmiennych
%   n - liczba punktow uzyta do interpolacji
%   a,b,c,d - wspolrzedne okreslajace prostokat

%baza

g{1} = @(x,y) 1 + x - x;
g{2} = @(x,y) x;
g{3} = @(x,y) y;
g{4} = @(x,y) x.*x.*y.*y;

%losowanie punktow
x = a + rand(n,1)*(b-a);
y = c + rand(n,1)*(d-c);

%wyznaczenie macierzy M, G, F
G = zeros(4);
D = zeros(4,1);

for j = 1:4
    for k = 1:4
        G(j,k) = sum(g{j}(x,y).*g{k}(x,y));
    end
end

for k = 1:4
    D(k,1) = sum(f(x,y).*g{k}(x,y));
end


A = G\D;
fApprox = @(x,y) A(1) + A(2).*x + A(3).*y + A(4).*x.*x.*y.*y;

tab(:,1) = x;
tab(:,2) = y;
tab(:,3) = f(x,y);
tab(:,4) = fApprox(x,y);
tab(:,5) = tab(:,4)-tab(:,3);
end


