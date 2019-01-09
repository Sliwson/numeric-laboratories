function wahadlo(l, t, n, alfa0, omega0)
%WAHADLO Funkcja symuluje zachowanie wahadla matematycznego o dlugosci l(m), w
%czasie t(s).
%n -liczba iteracji
%alfa0 - poczatkowe wychylenie wahadla
%omega0 - poczatkowa predkosc katowa wahadla
g =  9.80665;

y1 = zeros(1,n);
y2 = zeros(1,n);
x = zeros(1,n);

y1(1) = alfa0; %kat wychylenia wahadla
y2(1) = omega0; %predkosc katowa

h = t/n;
k = g/l;

x(1) = 0;
f1 = @(i, y1, y2) y2;
f2 = @(i, y1, y2) -k.*sin(y1);

for i = 1:n-1
    y1(i+1) = y1(i) + h*(f1(i,y1(i), y2(i)) + f1(i, y1(i)+h*f1(i,y1(i), y2(i)),y2(i)+h*f2(i,y1(i), y2(i))))./2;
    y2(i+1) = y2(i) + h*(f2(i,y1(i), y2(i)) + f2(i, y1(i)+h*f1(i,y1(i), y2(i)),y2(i)+h*f2(i,y1(i), y2(i))))./2;
    x(i+1) = x(i) + h;
end

subplot(2,1,1);
plot(x,y1)
title('Zale¿noœæ k¹ta wychylenia wahad³a od czasu')
xlabel('t(s)');
ylabel('\alpha(rad)');
line(xlim, [0 0],'Color','black','LineStyle','--');

subplot(2,1,2);
plot(x,y2)
title('Zale¿noœæ prêdkoœci k¹towej od czasu')
xlabel('t(s)');
ylabel('\omega(rad/s)');
line(xlim, [0 0],'Color','black','LineStyle','--');
end

