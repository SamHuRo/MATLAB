clear 
clc 

% [x,y] = ginput(4); 
% plot(x,y,'-o')
% 
% 
% %definicion de la variable t 
% t = 0:.01:1;
% 
% 
% %definicio de  las funciones de Overhauser 
% f0= -(.5)*t + t.^2 -(.5)*t.^3;
% f1= 1-(5/2)*t.^2 +(3/2)*t.^3;
% f2= (.5)*t + 2*t.^2 - (3/2)*t.^3;
% f3= -(.5)*t.^2 + (.5)*t.^3; 
% 
% 
% x1 = x(1)*f0 + x(2)*f1 + x(3)*f2 + x(4)*f3;
% y1 = y(1)*f0 + y(2)*f1 + y(3)*f2 + y(4)*f3;
% 
% hold on, grid on 
% plot(x1,y1,'k')
% 
% 
% %convercion de basse a la base de Bernstein 
% 
% %coeficientes del polinomio f(t) en la coordenada x 
% p0x = x(2); 
% p1x = (x(3)/2) - (x(1)/2);
% p2x = x(1) - (5*x(2)/2) + (2*x(3)) - (x(4)/2);
% p3x = (3*x(2)/2) - (x(1)/2) - (3*x(3)/2) + (x(4)/2); 
% %la funcion f(t) = p0 + p1*t + p2*t^2 + p3*t^3  en la coordenada x 
% 
% %para la coordenanda en y tenemos lo mismo pero con las componentes de y 
% p0y = y(2); 
% p1y = (y(3)/2) - (y(1)/2);
% p2y = y(1) - (5*y(2)/2) + (2*y(3)) - (y(4)/2);
% p3y = (3*y(2)/2) - (y(1)/2) - (3*y(3)/2) + (y(4)/2); 
% 
% n = 3; 
% 
% % b i componente x  n 
% b0x0 = p0x/nchoosek(n,0);
% b1x0 = p1x/nchoosek(n,1);
% b2x0 = p2x/nchoosek(n,2);
% b3x0 = p3x/nchoosek(n,3);
% 
% b0x1 = b1x0 + b0x0; 
% b1x1 = b2x0 + b1x0; 
% b2x1 = b3x0 + b2x0; 
% 
% b0x2 = b1x1 + b0x1; 
% b1x2 = b2x1 + b1x1; 
% 
% b0x3 = b0x2 + b1x2; 
% 
% % componente y 
% b0y0 = p0y/nchoosek(n,0);
% b1y0 = p1y/nchoosek(n,1);
% b2y0 = p2y/nchoosek(n,2);
% b3y0 = p3y/nchoosek(n,3); 
% 
% b0y1 = b1y0 + b0y0; 
% b1y1 = b2y0 + b1y0; 
% b2y1 = b3y0 + b2y0; 
% 
% b0y2 = b1y1 + b0y1; 
% b1y2 = b2y1 + b1y1; 
% 
% b0y3 = b0y2 + b1y2; 
% 
% % los puntos de control de bézier van a ser los b0xn y b0yn: 
% M = [b0x0 b0x1 b0x2 b0x3 ; b0y0 b0y1 b0y2 b0y3]; 
% plot(M(1,:),M(2,:),'-og')




%puntos de la fractura 
load('sec9.mat')

%sacar grupos de 20 puntos 
frac1 = sec(1:20,1:3);  
frac2 = sec(21:40,1:3);
frac3 = sec(41:60,1:3); 
frac4 = sec(61:80,1:3);  
frac5 = sec(81:100,1:3);  
frac6 = sec(101:120,1:3);  
frac7 = sec(121:140,1:3);  

plot3(frac1(:,1),frac1(:,2),frac1(:,3),'-o', frac2(:,1),frac2(:,2),frac2(:,3),'-o')
hold on 
plot3(frac3(:,1),frac3(:,2),frac3(:,3),'-o',frac4(:,1),frac4(:,2),frac4(:,3),'-o')
hold on 
plot3(frac5(:,1),frac5(:,2),frac5(:,3),'-o',frac6(:,1),frac6(:,2),frac6(:,3),'-o')
hold on 
plot3(frac7(:,1),frac7(:,2),frac7(:,3),'-o')
grid on 
title('Fractura'),xlabel('Eje x'),ylabel('Eje y'),zlabel('Eje z')

