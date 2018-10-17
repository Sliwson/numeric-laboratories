function displayComparison(handle1,handle2, A, b, w)
%DISPLAYCOMPARISON Funkcja wyswietla porownanie dwoch metod SOR
%   handle1 - funkcja SOR dla macierzy rozrzedzonej
%   handle2 - funkcja SOR dla macierzy kwadratowej

[n,~] = size(A);
ASparse = matrixToSparse(A);

disp('========================================================================================');
D = ['Porownanie dla macierzy ', num2str(n), 'x', num2str(n)];
disp(D);
disp('Metoda SOR dla macierzy rozrzedzonej:');

tic
[x1,k1] = handle1(ASparse, b, w);
t1 = toc;

D = ['Liczba iteracji: ', num2str(k1)];
disp(D);
D = ['Czas: ', num2str(t1)];
disp(D);

disp('Zwykla metoda SOR:');

tic
[x2,k2] = handle2(A, b, w);
t2 = toc;

D = ['Liczba iteracji: ', num2str(k2)];
disp(D);
D = ['Czas: ', num2str(t2)];
disp(D);

disp('Wbudowana funkcja matlaba: ');

tic
x3 = A\b;
t3 = toc;

D = ['Czas: ', num2str(t3)];
disp(D);

D = ['Porownanie wynikow (norma z roznicy wynikow metod SOR): ', num2str(norm(x1-x2))];
disp(D);
D = ['Porownanie wynikow (norma z roznicy metody SOR i wbudowanej funkcji matlaba): ', num2str(norm(x1-x3))];
disp(D);

D = ['Iloraz czasow metody SOR oraz metody SOR dla macierzy rozrzedzonych: ', num2str(t2/t1)];
disp(D);
D = ['Iloraz czasow wbudowanej funkcji matlaba oraz metody SOR dla macierzy rozrzedzonych: ', num2str(t3/t1)];
disp(D);

end

