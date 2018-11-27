warning('off','all')

%funkcja stala
f = @(x,y) 1 + x - x;
a = 1; 
c = 1;
b = 3; 
d = 3;

n = 10;
m = 10;

compareMatlab(f,a,b,c,d,n,m);

%funkcja liniowa
f = @(x,y) 2*x + 3*y;
compareMatlab(f,a,b,c,d,n,m);

%funkcja kwadratowa
f = @(x,y) -3.*x.*x + 2.*y.*y + 3.*x.*y - 8;
compareMatlab(f,a,b,c,d,n,m);

%funkcja trygonometryczna 
n = 500; m = 500;
f = @(x,y) sin(x) .* cos(y);
compareMatlab(f,a,b,c,d,n,m);

%wyznaczenie wspolczynnika zbieznosci
f = @(x,y) 2 .* x .* x .* y - 3.*cos(x.*y) + 3;

densities = [10,20,40,80,160,320,640,1280];
errors = zeros(1,8);
ratios = zeros(1,7);

n = 10; m = 10;
errors(1) = compareMatlab(f,a,b,c,d,n,m);

for i=2:8
    n = densities(i);
    m = densities(i);
    
    errors(i) = compareMatlab(f,a,b,c,d,n,m);
    ratios(i-1) = errors(i-1)/errors(i);
end

disp("============================================");
disp("Errors: ");
format long;
for i=1:8
    disp(['n = ', num2str(densities(i)), '; error = ', num2str(errors(i))]);
end
disp("Ratios: ");
format short;
disp(ratios);

%bardzo gesty podzial
n = 5000; m = 5000;
compareMatlab(f,a,b,c,d,n,m);

%funkcja z nieograniczona pochodn?
a = -1; b = 1; c = -1; d = 1;
f = @(x,y) tan(x./y);
compareMatlab(f,a,b,c,d,n,m);
