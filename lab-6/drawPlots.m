function drawPlots(l,t,n,alfa0,omega0)

[x,y1,y2] = wahadlo(l,t,n,alfa0,omega0);

figure;
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
hold off;
end

