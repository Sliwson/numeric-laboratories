function [lambda, iterations] = pMethod(v1, v2, v3, lambdaApproximation, precision, maxIterations)
%PMETHOD Znajduje wartosc wlasna macierzy A znajdujaca sie najblizej
%podanej wartosci wlasnej lambda. A jest trojdiagonalna i jej diagonale sa
%przekazane jako parametry v1, v2, v3, gdzie v2 to diagonala glowna.
%Obliczenia wykonywane sa dopoki nie zostanie osiagnieta zadana precyzja
%(precision)
n = size(v2,2);
v2 = v2 - lambdaApproximation*ones(1,n);

x_prev = rand(n,1); %losowe przyblizenie poczatkowe

lambdaPrev = lambdaApproximation;
lambda = lambdaApproximation + 2*precision; %aby uniknac spelnienia warunku w pierwszym sprawdzeniu
iterations = 0;

while(abs(lambda-lambdaPrev) >= precision)
    lambdaPrev = lambda;
    y_next = solveTridiagonal(v1,v2,v3,x_prev);
    s = dot(x_prev, y_next);
    lambda = 1/s + lambdaApproximation;
    x_prev = y_next/norm(y_next,2);
    
    iterations = iterations + 1;
    
    if(iterations > maxIterations)
        break;
    end
end
end
