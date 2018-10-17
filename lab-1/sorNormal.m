function [x, k] = sorNormal(A, b, w, xFirst, epsilon, maxIterations)
%SORSPARSE Funkcja rozwiazuje uklad rownan liniowych Ax = b metoda SOR
%   Parametry wejsciowe:
%   A - macierz wejsciowa
%   b - wektor wyrazow wolnych
%   w - parametr relaksacji metody SOR (domyslnie 1)
%   xFirst - przyblizenie poczatkowe (domyslnie wektor zerowy)
%   epsilon - liczba rzeczywista okreslajaca warunek stopu (jezeli norma 
%       z dwoch kolejnych przyblizen jest mniejsza od epsilon, zwracamy
%       wynik) (domyslnie 1e-5)
%   maxIterations - maksymalna liczba iteracji, jaka moze przeprowadzic
%       algorytm (domyslnie 1e5)
%   Parametry wyjsciowe:
%   x - rozwiazanie ukladu rownan liniowych Ax = b
%   k - liczba iteracji

%n - rozmiar wektora wyrazow wolnych
[n, ~] = size(b);

%definicja wartosci domyslnych
if nargin < 6
    maxIterations = 1e4;
end

if nargin < 5
    epsilon = 1e-5;
end

if nargin < 4
    xFirst = ones(n,1);
end

if nargin < 3
    w = 1;
end

%sprawdzenie elementow lezacych na diagonali
diagonal = diag(A);

%algorytm wymaga aby na diagonali nie wystepowal zerowy element
if(any(diagonal == 0))
    error("Diagonal element could not equal 0!");
end

%Algorytm SOR
x = xFirst;
xnext = xFirst;

flag = 0; %0 = praca petli, 1 = metoda zbiezna, 2 = metoda rozbiezna
iterations = 0;

while flag == 0
    for i = 1:n        
        j = 1:i-1;            
        sum1 = sum(A(i,j)'.*xnext(j));
        j = i+1:n;
        sum2 = sum(A(i,j)'.*x(j));
        
        xnext(i) = (1-w)*x(i) + w/A(i,i)*(b(i)- sum1 - sum2);
    end
    
    %sprawdzenie warunkow stopu 
    if norm(x - xnext) < epsilon
        flag = 1;
    end
    
    iterations = iterations + 1;
    
    if iterations > maxIterations
        flag = 2;
    end
    
    x = xnext;
end

if (flag == 2)
    disp("Metoda jest rozbiezna");
end

k = iterations;

end