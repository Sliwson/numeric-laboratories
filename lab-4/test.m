f = @(x,y) 1+x-x;
n = 10;
%presentResult(f,n,-2,2,-2,2);

f = @(x,y) 2.*x + 3.*y;
%presentResult(f,n,-2,2,-2,2);

f = @(x,y) -5 + 4.*x - 2.*y + 3.*y.*y.*x.*x + 1.5.*x.*x.*x.*x.*y - 3.*y.*y.*y;
presentResult(f,n,-2,2,-2,2);

f = @(x,y) sin(30./(x+y));
%presentResult(f,n,1,3,1,3);

f = @(x,y) sin(30./(x.*y.*y));
%presentResult(f,100,1,3,1,3);
    
f = @(x,y) x.*x.*x.*y.*y;
f = @(x,y) sin(x.*x+y.*y);
f = @(x,y) sin(5.*(x.*x+y.*y));
%presentResult(f,10,-2,2,-2,2);
%presentResult(f,20,-2,2,-2,2);
%presentResult(f,30,-2,2,-2,2);
%presentResult(f,40,-2,2,-2,2);