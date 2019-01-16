hold on;
subplot(2,1,1);
plot(x,y1);
hold on;
subplot(2,1,1);
plot(x,y3);
title('Zale�no�� k�ta wychylenia wahad�a od czasu')
xlabel('t(s)');
ylabel('\alpha(rad)');
line(xlim, [0 0],'Color','black','LineStyle','--');
legend('Ziemia','Ksi�yc');

hold on;
subplot(2,1,2);
plot(x,y2);
hold on;
subplot(2,1,2);
plot(x,y4);
title('Zale�no�� pr�dko�ci k�towej od czasu')
xlabel('t(s)');
ylabel('\omega(rad/s)');
line(xlim, [0 0],'Color','black','LineStyle','--');
legend('Ziemia','Ksi�yc');