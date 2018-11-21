function coeff = getCoefficient(x,y,n,m)
%GETCOEFFICIENT Zwraca wspolczynnik macierzy C w metodzie trapezow.
%x - wspolrzedna x
%y - wspolrzedna y
%n - ilosc podzialow wzdluz osi OX
%m = ilosc podzialow wzlduz osi OY
if (x == 1 || x == n+1)
    if(y == 1 || y==m+1)
        coeff = 1;
    else
        coeff = 2;
    end
elseif (y == 1 || y == m+1)
    coeff = 2;        
else
    coeff = 4;
end
    
end

