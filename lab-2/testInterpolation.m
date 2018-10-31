%Funkcja kwadratowa dwóch zmiennych - oczekujemy b??du zerowego.
f = @(x,y) 2 - 23*x + 30*y + 4*x*y - 2.5 * x*x +9*y*y;
testFourCases(f);

%funkcja trygonometryczna
f = @(x,y) sin(x) + 3*cos(y) - 4*sin(x*y) + 8*cos(x*x*y);
testFourCases(f);

%funkcja której pochodna w naszym obszarze jest nieograniczona.
f = @(x,y) tan (2*x + 3*y);
testFourCases(f)