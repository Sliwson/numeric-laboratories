function [fApprox, tab] = lsfApproximation(f,n,a,b,c,d)
%lsfApproximation Przybliza funkcje f wzorami empirycznymi w bazie
%1,x,y,x^2y^2, tak aby zminimalizowac blad kwadratowy. Przyblizenie
%wykonujemy na n losowych punktach z prostokata [a,b]x[c,d].
%   f - uchwyt do funkcji dwoch zmiennych
%   n - liczba punktow uzyta do interpolacji
%   a,b,c,d - wspolrzedne okreslajace prostokat

%baza
g1 = @(x,y) ones(size(x));
g2 = @(x,y) x;
g3 = @(x,y) y;
g4 = @(x,y) x.*x.*y.*y;

%losowanie punktow
x = a + rand(n,1)*(b-a);
y = c + rand(n,1)*(d-c);

%obliczenie wspolczynnikow
M = [g1(x,y),g2(x,y),g3(x,y),g4(x,y)];

G = M' * M;

F = f(x,y);

D = M' * F;

A = G\D;

%wzor szukanej funkcji
fApprox = @(x,y) A(1) + A(2).*x + A(3).*y + A(4).*x.*x.*y.*y;

%uzupelnienie tablicy wyjsicowej
tab = zeros(n,5);

tab(:,1) = x;
tab(:,2) = y;
tab(:,3) = f(x,y);
tab(:,4) = fApprox(x,y);
tab(:,5) = tab(:,4)-tab(:,3);
end

