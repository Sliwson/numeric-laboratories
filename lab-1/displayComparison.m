function displayComparison(handle1,handle2, A, b, w)
%DISPLAYCOMPARISON Funkcja wyswietla porownanie dwoch metod SOR
%   handle1 - funkcja SOR dla macierzy rozrzedzonej
%   handle2 - funkcja SOR dla macierzy kwadratowej

ASparse = matrixToSparse(A);

[x1,k1] = handle1(ASparse, b, w);

handle = @() handle1(ASparse, b, w);
t1 = timeit(handle);

[x2,k2] = handle2(A, b, w);

handle = @() handle2(A, b, w);
t2 = timeit(handle);

D = ['Porownanie wynikow (norma z roznicy): ', num2str(norm(x1-x2))];
disp(D);
disp('Metoda SOR dla macierzy rozrzedzonej:');
D = ['Czas: ', num2str(t1)];
disp(D);
D = ['Liczba iteracji: ', num2str(k1)];
disp(D);
disp('Zwykla metoda SOR:');
D = ['Czas: ', num2str(t2)];
disp(D);
D = ['Liczba iteracji: ', num2str(k2)];
disp(D);
D = ['Iloraz czasow: ', num2str(t2/t1)];
disp(D);

end

