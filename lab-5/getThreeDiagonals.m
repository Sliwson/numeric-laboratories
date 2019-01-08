function [v1,v2,v3] = getThreeDiagonals(A)
%GETTHREEDIAGONALS Funkcja zwraca 3 diagonalne macierzy trojdiagonalnej A,
%gdzie v1 to diagonala gorna, v2 - glowna, v3 - dolna.
v1 = diag(A,1)';
v2 = diag(A)';
v3 = diag(A,-1)';
end

