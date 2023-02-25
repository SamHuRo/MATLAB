clear 
clc

%definicion de los puntos de control 
P0 =[-1.54 .4];
P1 =[-4.1 2.82];
P2 =[-.78 5.02];
P3 =[2.38 3.4];
P4 =[1.5 1.28];


%poligono de control 
V = [P0' P1' P2' P3' P4'];
plot(V(1,:),V(2,:),'-go'), grid on 

t = 0:.01:1;
%funciones de la curva 
f0= -(.5)*t + t.^2 -(.5)*t.^3;
f1= 1-(5/2)*t.^2 +(3/2)*t.^3;
f2= (.5)*t + 2*t.^2 - (3/2)*t.^3;
f3= -(.5)*t.^2 + (.5)*t.^3; 

%primera curva de overhauser 
x = P0(1)*f0 + P1(1)*f1 + P2(1)*f2 + P3(1)*f3; 
y = P0(2)*f0 + P1(2)*f1 + P2(2)*f2 + P3(2)*f3; 

hold on 
plot(x,y,'b')

%segunda curva de overhauser 
x1= P1(1)*f0 + P2(1)*f1 + P3(1)*f2 + P4(1)*f3; 
y1= P1(2)*f0 + P2(2)*f1 + P3(2)*f2 + P4(2)*f3;

hold on 
plot(x1,y1,'k')

