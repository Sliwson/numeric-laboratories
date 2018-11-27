function  err = compareMatlab(f,a,b,c,d,n,m)
%COMPAREMATLAB Funkcja porownuje dzialanie naszej funkcji z wynikiem
%uzyskanym za pomoca funkcji Matlaba
result = trapezeInterpolation(f,a,b,c,d,n,m);
resultMatlab = integral2(f,a,b,c,d);

syms x y;
resultSymbolic = int(int(f,x,a,b),y,c,d);

format long;
disp("============================================");
disp(f);
disp(['D = [',num2str(a),',',num2str(b),']x[',num2str(c),',',num2str(d),']']);
disp(['n = ',num2str(n),', m = ',num2str(m)]);
disp(['result = ', num2str(result, 10)]);
disp(['Matlab = ', num2str(resultMatlab, 10)]);
try
    disp(['Symbolic = ', num2str(double(resultSymbolic), 10)]);
    err = abs(resultSymbolic-result);
catch 
    disp('Symbolic function cannot compute result');
    err = -1;
end
end

