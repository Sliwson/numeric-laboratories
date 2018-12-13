%f = @(x,y) x.*x + 2.*x.*y - 3.*y - 8 + cos(x.*y);
f = @(x,y) sin(5.*(x.*x+y.*y));

%presentResult(f,4,-2,2,-2,2);

errors = zeros(1,1996);
for i = 4:1:2000
[~, ~, errors(i-3)] = lsfApproximation(f,i,-2,2,-2,2);
end

scatter(4:2000, errors);
xlabel('n');
ylabel('MSE');
title('Zaleznosc bledu sredniokwadratowego od ilosci punktow pomiarowych');