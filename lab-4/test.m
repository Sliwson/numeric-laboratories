f = @(x,y) 1+x-x;
n = 10;
%presentResult(f,n,-2,2,-2,2);

f = @(x,y) 2.*x + 3.*y;
%presentResult(f,n,-2,2,-2,2);

f = @(x,y) -5 + 4.*x - 2.*y + 3.*y.*y.*x.*x;
%presentResult(f,n,-2,2,-2,2);

f = @(x,y) sin(30./(x+y));
%presentResult(f,n,1,3,1,3);

f = @(x,y) sin(30./(x.*y.*y));
%presentResult(f,100,1,3,1,3);

f = @(x,y) x.*x.*x.*y.*y;
presentResult(f,100,-2,2,-2,2);