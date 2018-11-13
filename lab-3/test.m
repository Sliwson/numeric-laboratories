%funkcja stala
f = @(x,y) 1 + x - x;
a = -2; 
c = -2;
b = 2; 
d = 2;

n = 10;
m = 10;

compareMatlab(f,a,b,c,d,n,m);

f = @(x,y) 2 .* x .* x .* y - 3.*cos(x.*y) + 3;
compareMatlab(f,a,b,c,d,n,m);
n = 20; m = 20;
compareMatlab(f,a,b,c,d,n,m);
n = 50; m = 50;
compareMatlab(f,a,b,c,d,n,m);
n = 100; m = 100;
compareMatlab(f,a,b,c,d,n,m);
n = 1000; m = 1000;
compareMatlab(f,a,b,c,d,n,m);

