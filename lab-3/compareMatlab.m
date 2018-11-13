function  compareMatlab(f,a,b,c,d,n,m)
%COMPAREMATLAB Funkcja porownuje dzialanie naszej funkcji z wynikiem
%uzyskanym funkcj? Matlaba
result = trapezeInterpolation(f,a,b,c,d,n,m);
resultMatlab = integral2(f,a,b,c,d);

format long;
disp("============================================");
disp(f);
disp(['D = [',num2str(a),',',num2str(b),']x[',num2str(c),',',num2str(d),']']);
disp(['n = ',num2str(n),', m = ',num2str(m)]);
disp(['result = ', num2str(result, 10)]);
disp(['Matlab = ', num2str(resultMatlab, 10)]);
disp(['difference = ', num2str(result - resultMatlab)]);
end

