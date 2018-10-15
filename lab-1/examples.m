%mala macierz (5x5)
A = [4,0,0,0,3;
     3,5,0,0,2;
     0,0,3,0,0;
     2,0,0,6,0;
     1,0,0,0,1];
 
b = [1;2;3;4;5];
 
displayComparison(@sorSparse, @sorNormal, A, b, 1.25);
 
%sredniej wielkosci macierz (14x14)
A = generateSquareMatrix(14, 0.95, 3, 10);
b = 0.5 - rand(14,1);
 
displayComparison(@sorSparse, @sorNormal, A, b, 1.25);
 
%duza macierz (20000x20000)
A = generateSquareMatrix(1000, 0.97, 1, 200);
b = 0.5 - rand(1000,1);
 
displayComparison(@sorSparse, @sorNormal, A, b, 1.25);