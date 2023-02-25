clear all
clc

t = 0:.001:1;

b0 = (1-t).^3;
b1 = 3*t.*(1-t).^2;
b2 = 3*t.^2.*(1-t);
b3 = t.^3;

[x,y]= ginput(4);

V =[x,y];

x1 = x(1)*b0 + x(2)*b1 + x(3)*b2 + x(4)*b3;
y1 = y(1)*b0 + y(2)*b1 + y(3)*b2 + y(4)*b3;


figure(1)
plot(x1,y1), grid on 
hold on 
plot(V(:,1),V(:,2),'-or')