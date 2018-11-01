%Funkcja kwadratowa dwóch zmiennych - oczekujemy b??du zerowego.
f = @(x,y) 2 - 23*x + 30*y + 4*x*y - 2.5 * x*x +9*y*y;
testFourCases(f);

%funkcja trygonometryczna
f = @(x,y) sin(x) + 3*cos(y) - 4*sin(x*y) + 8*cos(x*x*y);
testFourCases(f);

%funkcja której pochodna w naszym obszarze jest nieograniczona.
f = @(x,y) tan (2*x + 3*y);
testFourCases(f);

%wyznaczenie wspolczynnnika zbieznosci
disp('===============TEST CASE===============');
f = @(x,y) (4.*cos(x) + 2.*y.*y - 4.*x.^5)/(2.*x.^2 + 3 + 8*y.^2);
j = [2,4,8,16,32,64,128,256];


[~,err1] = squareInterpolation(f,1);

for i = 1:8
    [~,err2] = squareInterpolation(f,j(i));
    disp(err1/err2);
    err1=err2;
end