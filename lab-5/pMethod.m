function lambda = pMethod(v1, v2, v3, lambdaApproximation, iterations)
%PMETHOD Znajduje wartosc wlasna macierzy A znajdujaca sie najblizej
%podanej wartosci wlasnej lambda. A jest trojdiagonalna i jej diagonale sa
%przekazane jako parametry v1, v2, v3, gdzie v2 to diagonala glowna.
%Obliczenia wykonywane sa dopoki nie zostanie osiagnieta liczba iteracji
%(iterations)

n = size(v2,2);
v2 = v2 - lambdaApproximation*ones(1,n);

x_prev = ones(n,1);

for i=1:iterations
    y_next = solveTridiagonal(v1,v2,v3,x_prev);
    x_prev = y_next/norm(y_next);
end

s = dot(x_prev, y_next);
lambda = 1/s + lambdaApproximation;
end
