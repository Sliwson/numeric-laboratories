%mala macierz (5x5)
A = [4,0,0,0,3;
     3,5,0,0,2;
     0,0,3,0,0;
     2,0,0,6,0;
     1,0,0,0,1];
 
b = [1;2;3;4;5];
 
displayComparison(@sorSparse, @sorNormal, A, b, 1.25);
 
%sredniej wielkosci macierz (14x14)
A = generateSquareMatrix(14, 0.95, 3, 10, 5);
b = 0.5 - rand(14,1);
 
displayComparison(@sorSparse, @sorNormal, A, b, 1.25);

%sredniej wielkosci macierz (25x25)
A = generateSquareMatrix(25, 0.95, 3, 10, 5);
b = 0.5 - rand(25,1);
 
displayComparison(@sorSparse, @sorNormal, A, b, 1.25);

%duza macierz (1000x1000)
A = generateSquareMatrix(1000, 0.97, 1, 200, 5);
b = 0.5 - rand(1000,1);
 
displayComparison(@sorSparse, @sorNormal, A, b, 1.25);

%duza macierz (5000x5000)
A = generateSquareMatrix(5000, 0.99, 1, 200, 5);
b = 0.5 - rand(5000,1);
 
displayComparison(@sorSparse, @sorNormal, A, b, 1.25);

%macierz najprawdopodobniej rozbiezna (100x100)
A = generateSquareMatrix(100, 0.5, 10, 1, -0.5);
b = 0.5 - rand(100,1);
 
displayComparison(@sorSparse, @sorNormal, A, b, 1.25);