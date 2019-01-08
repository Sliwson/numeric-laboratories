v1 = [1,2,3,4,5];
v2 = [11,22,33,44,55,66];
v3 = [5,4,3,2,1];

A = createMatrixFromVectors(v1,v2,v3);

max = 1000;
approximation = 0;

j = 1:15;
iterations = zeros(1,15);
lambdas = zeros(15,1);

for i=-1:-1:-15
    [lambdas(-i), iterations(-i)] = pMethod(v1,v2,v3,approximation, 10^i,max);
end

e = eig(A);
errors = lambdas - e(1);

disp(errors);
scatter(j, iterations);

xlabel('dokladnosc (10^{-x})');
ylabel('liczba iteracji');
title('Wykres liczby iteracji od zadanej dokladnosci');
axis([ 0 15 0 55]);