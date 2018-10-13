function s = matrixToSparse(A)
%MATRIXTOSPARSE Funkcja przeksztalca macierz podana w postaci tablicy nxn tak,
%aby w wyjsciowej macierzy kazda kolumna zawierala wiersz, kolumne oraz wartosc
%kazdego niezerowego elementu macierzy wejsciowej.
%   A - macierz wejsciowa o rozmiarze nxn
[a,b] = size(A);

if a ~= b
    error("Macierz a musi byc kwadratowa");
end

counter = 1; %indeks kolumny macierzy s do ktorej wstawiamy kolejny element z A
nonZeroCount = 0;

%liczymy niezerowe elementy, aby prealokowac s
for i=1:a
    for j=1:a
        if A(i,j) ~= 0
            nonZeroCount = nonZeroCount + 1;
        end
    end
end

%prealokowanie pamieci
s = zeros(3,nonZeroCount);

%wstawienie niezerowych elementow do s
for i=1:a
    for j=1:a
        if A(i,j) ~= 0
            s(1,counter) = i;
            s(2,counter) = j;
            s(3,counter) = A(i,j);
            counter = counter + 1;
        end
    end
end

end

