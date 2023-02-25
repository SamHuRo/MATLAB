t = 0:.001:1;

%funciones de Bernstein 
b0 = (1-t).^2;
b1 = 2*t.*(1-t);
b2 = t.^2;

%suma de las fuciones de bernstein son igual a 1 
s = b0 + b1 + b2;
figure(2)
plot(t,s)
grid on 

%funciones indivuduales de bernstein 
figure(1);
plot(t,b0);
hold on 
plot(t,b1);
plot(t,b2);
grid on 

%puntos de control 
P0 = [1,0,1];
P1 = [0,2,0];
P2 = [-2,5,1];

x = P0(1)*b0 + P1(1)*b1 + P2(1)*b2;
y = P0(2)*b0 + P1(2)*b1 + P2(2)*b2;
z = P0(3)*b0 + P1(3)*b1 + P2(3)*b2;

P = [P0; P1; P2];

figure(3)
plot3(x,y,z), grid on 
hold on 
plot3(P(:,1),P(:,2),P(:,3))