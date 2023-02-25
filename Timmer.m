clear 
clc

%definicion de los puntos de control 
P0 = [-1.54 .4];
P1 = [-3.38 3.36];
P2 = [3.02 4.28];
P3 = [2.2 1.68];

V = [ P0' P1' P2' P3'];
figure(1);
plot(V(1,:),V(2,:),'-ro'), grid on 

%definicon de variable t 
t = 0:.01:1; 
%definicion de las funciones 
f0 = (1-2.*t).*(1-t).^2;
f1 = 4.*t.*(1-t).^2;
f2 = 4.*t.^2.*(1-t);
f3 = (2.*t-1).*t.^2; 

x = P0(1)*f0 + P1(1)*f1 + P2(1)*f2 + P3(1)*f3; %curva de bezier componente x 
y = P0(2)*f0 + P1(2)*f1 + P2(2)*f2 + P3(2)*f3; %curva de bezier componente y

hold on 
plot(x,y,'b')

%comparamos con una curva de bezier 
b0 = (1-t).^3;
b1 = nchoosek(3,1)*(1-t).^2.*t;
b2 = nchoosek(3,2)*(1-t).*t.^2;
b3 = nchoosek(3,3)*t.^3;

x1 = P0(1)*b0 + P1(1)*b1 + P2(1)*b2 + P3(1)*b3; %curva de bezier componente x 
y1 = P0(2)*b0 + P1(2)*b1 + P2(2)*b2 + P3(2)*b3; %curva de bezier componente y

hold on 
plot(x1,y1,'o')

