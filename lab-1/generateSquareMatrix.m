function A = generateSquareMatrix(n, zeroProbability, multiplier, diagMultiplier, diagOffset)
%GENERATESQUAREMATRIX Funkcja generuje kwadratowa macierz nxn;
%   n - rozmiar macierzy wyjsciowej
%   zeroProbability - prawdopodobienstwo ze pole jest zerem (oprocz
%       diagonali)
%   multiplier - mnoznik wszystkich elementow oprocz diagonali (aby uzyskac
%       wiekszy zakres)
%   diagMultiplier - mnoznik diagonali (pomocne w tworzeniu macierzy
%       diagonalnie dominujacych)
%   diagOffset - zmienna, ktora dodajemy do rand przy generowaniu elementow
%       diagonali

A = zeros(n,n);

for i=1:n
    for j=1:n
        if i==j
            A(i,j) = (rand(1) + diagOffset) * diagMultiplier;
        else
            if rand(1) > zeroProbability
                A(i,j) = (rand(1)-0.5) * multiplier;
            end
        end
    end
end

end

