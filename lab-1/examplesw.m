%duza macierz (100x100)
A = generateSquareMatrix(100, 0.97, 1, 10, 0);
b = 0.5 - rand(100,1);

disp('w = 0.25:');
displayComparison(@sorSparse, @sorNormal, A, b, 0.25);
disp('w = 0.5:');
displayComparison(@sorSparse, @sorNormal, A, b, 0.5);
disp('w = 0.75:');
displayComparison(@sorSparse, @sorNormal, A, b, 0.75);
disp('w = 1:');
displayComparison(@sorSparse, @sorNormal, A, b, 1);
disp('w = 1.25:');
displayComparison(@sorSparse, @sorNormal, A, b, 1.25);
disp('w = 1.5:');
displayComparison(@sorSparse, @sorNormal, A, b, 1.5);
disp('w = 1.75:');
displayComparison(@sorSparse, @sorNormal, A, b, 1.75);
disp('w = 2');
displayComparison(@sorSparse, @sorNormal, A, b, 2);
