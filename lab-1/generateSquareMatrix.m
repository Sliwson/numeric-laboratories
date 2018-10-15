function A = generateSquareMatrix(n, zeroProbability, multiplier, diagMultiplier)
%GENERATESQUAREMATRIX Funkcja generuje kwadratowa macierz nxn;
%   n - rozmiar macierzy wyjsciowej
%   zeroProbability - prawdopodobienstwo ze pole jest zerem (oprocz
%       diagonali)
%   multiplier - mnoznik wszystkich elementow oprocz diagonali (aby uzyskac
%       wiekszy zakres)
%   diagMultiplier - mnoznik diagonali (pomocne w tworzeniu macierzy
%       diagonalnie dominujacych)

A = rand(n) - 0.5;

for i=1:n
    for j=1:n
        if i==j
            A(i,j) = A(i,j) * diagMultiplier;
        else
            if rand(1) < zeroProbability
                A(i,j) = 0;
            else
                A(i,j) = A(i,j) * multiplier;
            end
        end
    end
end

end

