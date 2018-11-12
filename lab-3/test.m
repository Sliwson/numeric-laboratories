%funkcja sta?a
f = @(x,y) 1 + x - x;
a = -2; 
c = -2;
b =  2; 
d = 2;

n = 100;
m = 100;

result = trapezeInterpolation(f,a,b,c,d,n,m);
resultMatlab = integral2(f,a,b,c,d);

disp(result - resultMatlab);
