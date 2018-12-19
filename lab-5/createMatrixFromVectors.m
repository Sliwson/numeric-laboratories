function A = createMatrixFromVectors(v1,v2,v3)
%CREATEMATRIXFROMVECTORS Tworzy macierz trojdiagonalna, taka ze v2 to
%glowna diagonala, v1 - gorna, v3 - dolna

A = diag(v2) + diag(v1,1) + diag(v3,-1);
end

