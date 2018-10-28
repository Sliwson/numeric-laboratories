function A = initializeAfromT(T,X,Y)
%INITIALIZEAFROMT Przeprowadza konwersje ze wspolrzednych iteracyjnych
%(<1,k>) na wspolczynniki plaszczyzny kartezjanskiej   
x1 = X(T(1),T(2));
x2 = X(T(3),T(4));
x3 = X(T(5),T(6));
y1 = Y(T(1),T(2));
y2 = Y(T(3),T(4));
y3 = Y(T(5),T(6));
A = [x1, y1, x2, y2, x3, y3, (x1+x2)/2, (y1+y2)/2,(x2+x3)/2, (y2+y3)/2, (x1+x3)/2, (y1+y3)/2];
end

