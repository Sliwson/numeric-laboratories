n = 1000;

y1 = zeros(1,n);
y2 = zeros(1,n);
x = zeros(1,n);

y1(1) = 0.65; %kat wychylenia wahadla
y2(1) = 0.4; %predkosc katowa

h = 0.01;
k = 10;

x(1) = 0;

f1 = @(i, y1, y2) y2;
f2 = @(i, y1, y2) -k.*sin(y1);

for i = 1:n-1
    y1(i+1) = y1(i) + h*(f1(i,y1(i), y2(i)) + f1(i, y1(i)+h*f1(i,y1(i), y2(i)),y2(i)+h*f2(i,y1(i), y2(i))))./2;
    y2(i+1) = y2(i) + h*(f2(i,y1(i), y2(i)) + f2(i, y1(i)+h*f1(i,y1(i), y2(i)),y2(i)+h*f2(i,y1(i), y2(i))))./2;
    x(i+1) = x(i) + h;
end

plot(x,y1);
hold on;
plot(x,y2);

