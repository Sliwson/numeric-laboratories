function presentResult(f,n,a,b,c,d)
%PRESENTRESULT Wyswietla wynik dzialania funkcji lsfApproximation w
%eleganckim formacie

[fApprox, tab, err] = lsfApproximation(f,n,a,b,c,d);

hold off;
set(gcf, 'Position', get(0, 'Screensize'));
fsurf(f,[a,b,c,d],'r');
hold on;
fsurf(fApprox,[a,b,c,d],'--','EdgeColor','g');

f = figure('Position', [100 100 1050 750]);
t = uitable('Parent', f, 'Position', [25 25 1000 700], 'Data', tab);
t.ColumnName = {'x', 'y', 'f', 'fApprox', 'error'};
t.ColumnFormat = {'Long', 'Long', 'Long', 'Long', 'Long'};
t.ColumnWidth = {190, 190, 190, 185, 180};

disp(['MSE = ', num2str(err)]);
end

