n = 1000;

y1 = zeros(1,n);
y2 = zeros(1,n);
x = zeros(1,n);

y1(1) = 0; %kat wychylenia wahadla
y2(1) = 2; %predkosc katowa

h = 0.01;
k = 10;

x(1) = 0;

f1 = @(i, y1, y2) y2;
f2 = @(i, y1, y2) -k.*sin(y1);


curve = animatedline();
curve2 = animatedline('Color','red');
set(gca,'XLim',[0, n*h], 'YLim', [-10 10]);
line(xlim, [0 0],'Color','black','LineStyle','--');
grid on;

for i = 1:n-1
    addpoints(curve, x(i), y1(i));
    addpoints(curve2, x(i), y2(i));
    drawnow;
    y1(i+1) = y1(i) + h*(f1(i,y1(i), y2(i)) + f1(i, y1(i)+h*f1(i,y1(i), y2(i)),y2(i)+h*f2(i,y1(i), y2(i))))./2;
    y2(i+1) = y2(i) + h*(f2(i,y1(i), y2(i)) + f2(i, y1(i)+h*f1(i,y1(i), y2(i)),y2(i)+h*f2(i,y1(i), y2(i))))./2;
    x(i+1) = x(i) + h;
end

% subplot(2,1,1);
% plot(x,y1)
% title('Zale¿noœæ k¹ta wychylenia wahad³a od czasu')
% xlabel('t(s)');
% ylabel('\alpha(rad)');
% line(xlim, [0 0],'Color','black','LineStyle','--');
% 
% subplot(2,1,2);
% plot(x,y2)
% title('Zale¿noœæ prêdkoœci k¹towej od czasu')
% xlabel('t(s)');
% ylabel('\omega(rad/s)');
% line(xlim, [0 0],'Color','black','LineStyle','--');