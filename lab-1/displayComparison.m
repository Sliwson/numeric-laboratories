function displayComparison(handle1,handle2, A, b, w)
%DISPLAYCOMPARISON Funkcja wyswietla porownanie dwoch metod SOR
%   handle1 - funkcja SOR dla macierzy rozrzedzonej
%   handle2 - funkcja SOR dla macierzy kwadratowej

[n,~] = size(A);
ASparse = matrixToSparse(A);

[x1,k1] = handle1(ASparse, b, w);

handle = @() handle1(ASparse, b, w);
t1 = timeit(handle);

[x2,k2] = handle2(A, b, w);

handle = @() handle2(A, b, w);
t2 = timeit(handle);

handle = @() A\b;
x3 = handle();
t3 = timeit(handle);

disp('========================================================================================');
D = ['Porownanie dla macierzy ', num2str(n), 'x', num2str(n)];
disp(D);
D = ['Porownanie wynikow (norma z roznicy wynikow metod SOR): ', num2str(norm(x1-x2))];
disp(D);
D = ['Porownanie wynikow (norma z roznicy metody SOR i wbudowanej funkcji matlaba): ', num2str(norm(x1-x3))];
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
disp('Wbudowana funkcja matlaba: ');
D = ['Czas: ', num2str(t3)];
disp(D);
D = ['Iloraz czasow metod SOR: ', num2str(t2/t1)];
disp(D);

end

