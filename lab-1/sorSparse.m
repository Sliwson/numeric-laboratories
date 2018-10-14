function [x, k] = sorSparse(A, b, w, xFirst, epsilon, maxIterations)
%SORSPARSE Funkcja rozwiazuje uklad rownan liniowych Ax = b metoda SOR
%   Parametry wejsciowe:
%   A - macierz wejsciowa w postaci rozrzedzonej (kazda kolumna A zawiera
%       indeks wiersza, kolumny oraz wartosc kazdego niezerowego elementu)
%   b - wektor wyrazow wolnych
%   w - parametr relaksacji metody SOR
%   xFirst - przyblizenie poczatkowe
%   epsilon - liczba rzeczywista okreslajaca warunek stopu (jezeli norma 
%       z dwoch kolejnych przyblizen jest mniejsza od epsilon, zwracamy
%       wynik)
%   maxIterations - maksymalna liczba iteracji, jaka moze przeprowadzic
%       algorytm
%   Parametry wyjsciowe:
%   x - rozwiazanie ukladu rownan liniowych Ax = b
%   k - liczba iteracji

%n - rozmiar wektora wyrazow wolnych
[n, ~] = size(b);

%sprawdzenie elementow lezacych na diagonali
diagonal = zeros(1,n);

[~, k] = size(A);

for a = 1:k
    if A(1,a) == A(2,a)
        diagonal(A(1,a)) = A(3,a);
    end
end

%algorytm wymaga aby na diagonali nie wystepowal zerowy element
if(any(diagonal == 0)
    error("Diagonal element could not equal 0!");
end

%sortowanie kolumn wedlug pierwszego wiersza
A = sortrows(A')';

%definiujemy podzial aby ulatwic prace petli sumujacych w metodzie SOR
rowSplit = zeros(1,n);
rowBeginnings = zeros(1,n);

for a = 1:k
    rowSplit(A(1,a)) = rowSplit(A(1,a)) + 1;
end

rowBeginnings(1) = 1;
for a = 2:n
    rowBeginnings(a) = rowBeginnings(a-1)+rowSplit(a-1);
end

%Algorytm SOR
x = xFirst;
xnext = xFirst;

flag = 0; %0 = praca petli, 1 = metoda zbiezna, 2 = metoda rozbiezna
iterations = 0;

while flag == 0
    for i = 1:n
        sum1=0;
        sum2=0;
        
        for j = rowBeginnings(i):rowBeginnings(i)+rowSplit(i)-1
            column = A(2,j);
            value = A(3,j);
            
            if(column < i)
                sum1 = sum1 + value*xnext(column);
            elseif (column > i)
                sum2 = sum2 + value*x(column);
            end
        end
        
        xnext(i) = (1-w)*x(i) + w/diagonal(i)*(b(i)- sum1 - sum2);
    end
    
    %sprawdzenie warunkow stopu 
    if norm(x - xnext) < epsilon
        flag = 1;
    end
    
    if iterations > maxIterations
        flag = 2;
    end
    
    iterations = iterations + 1;
    x = xnext;
end

if (flag == 2)
    error("Metoda jest rozbiezna");
end

k = iterations;

end

