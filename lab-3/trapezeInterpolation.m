function result = trapezeInterpolation(fun, a, b, c, d, n, m)
%TRAPEZEINTERPOLATION Funckja oblicza calke podwojna z funkcji fun na
%obszarze [a,b]x[c,d] zlozonymi kwadraturami trapezow ze wzgledu na kazda
%zmienna.

h1 = (b-a)/n;
h2 = (d-c)/m;

x = linspace(a,b,n+1);
y = linspace(c,d,m+1);

cPrev = h1*h2/4;

result = 0;
for i=1:n+1
    for j=1:m+1
        result = result + cPrev * getCoefficient(i,j,n,m) * fun (x(i),y(j));
    end
end
end

