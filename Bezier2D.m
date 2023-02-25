clear
clc

t = 0:.001:1;

b0 = (1-t).^2;
b1 = 2*t.*(1-t);
b2 = t.^2; 

P0 = [2,1];
P1 = [0,3];
P2 = [4,3];

x = P0(1)*b0 + P1(1)*b1 + P2(1)*b2;
y = P0(2)*b0 + P1(2)*b1 + P2(2)*b2;

P = [P0, P1, P2]; 


figure(1)
plot(x,y), grid on 
hold on 
plot([P0(1) P1(1) P2(1)],[P0(2) P1(2) P2(2)],'r')