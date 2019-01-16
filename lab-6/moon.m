hold on;
subplot(2,1,1);
plot(x,y1);
hold on;
subplot(2,1,1);
plot(x,y3);
title('Zale¿noœæ k¹ta wychylenia wahad³a od czasu')
xlabel('t(s)');
ylabel('\alpha(rad)');
line(xlim, [0 0],'Color','black','LineStyle','--');
legend('Ziemia','Ksiê¿yc');

hold on;
subplot(2,1,2);
plot(x,y2);
hold on;
subplot(2,1,2);
plot(x,y4);
title('Zale¿noœæ prêdkoœci k¹towej od czasu')
xlabel('t(s)');
ylabel('\omega(rad/s)');
line(xlim, [0 0],'Color','black','LineStyle','--');
legend('Ziemia','Ksiê¿yc');