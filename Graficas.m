clear 
clc

% Graficas en 2D
x = 0:pi/100:2*pi; % tambine se puede con x = linspace(0,pi/100,2*pi)
y = sin(x);

figure(1);
plot(x,y);


%Otro ejemplo es 
x1 = linspace(0,2*pi,300);
y1 = sin(x);
z1 = sin(x+ pi/3);

figure(2)
hold on 
plot(x,y1,'r-'), grid on
plot(x,z1,'g--')


% Curvas parametricas 
t = linspace(-pi,pi,300);

figure(3)
plot((2*cos(t).^3),(2*sin(t).^3)), grid on 

figure(4)
plot(((2/3).*t.*cos(7.*t./2)),((2/3).*t.*sin(7./t)),'o'), grid on, title 'Funcion'


% Curvas polares 
theta = linspace(-pi, pi, 100);


r = 7-7*cos(theta);

r1 = 3 - 6*sin(theta);

r2 = sin(6.*theta);

r3 = cos(8.*theta);

r4 = sqrt(5*cos(2.*theta));

figure(5)
polarplot(theta,r,'y-',theta,r1,'m--')


figure(6)
polarplot(theta,r2,':')


figure(7)
polarplot(theta,r3)


%Graficas en 3D
figure(8)
plot3(cos(t),2*cos(t).^2,(1/4)*sin(t)), grid on 


t1 = linspace(-4,3,100);
figure(9)
plot3(2*cos(t1).^3,2*sin(t1).^3,t1,'b'),grid on 


% graficas de la forma z=f(x,y)
[x2,y2] = meshgrid(-5:0.1:5);
z2 = exp(-(x2.^2 + y2.^2));

figure(10)
plot3(x2,y2,z2)

[x3,y3] = meshgrid(-5:.1:5);
z3 = -sqrt(abs(x3.*y3));

figure(11)
surf(x3,y3,z3)


z4 = (y3.^2)/5 - 3 .*abs(x3);

figure(12)
surf(x3,y3,z4)



