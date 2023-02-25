clear  all
clc 

[x,y] = ginput(5); 


% t=0:.01:1;
% 
% b0 = (1-t).^4;
% b1 = nchoosek(4,1)*(1-t).^3.*t;
% b2 = nchoosek(4,2)*(1-t).^2.*t.^2;
% b3 = nchoosek(4,3)*(1-t).*t.^3;
% b4 = nchoosek(4,4)*t.^4;
% 
% 
% x1 = x(1)*b0 + x(2)*b1 + x(3)*b2 + x(4)*b3 + x(5)*b4; %curva de bezier componente x 
% y1 = y(1)*b0 + y(2)*b1 + y(3)*b2 + y(4)*b3 + y(5)*b4; %curva de bezier componente y
% 
plot(x,y,'-o')
% hold on 
% plot(x1,y1,'b')

tmin = -2;
tmax = 2;
t1 = tmin:.01:tmax; %nuevo intervalo 

%definicion de los nuevos polinomis de bernstein en el nuevo intervalo

b0r = ((tmax-t1)/(tmax-tmin)).^4;
b1r = nchoosek(4,1)*((tmax-t1)/(tmax-tmin)).^3.*((t1-tmin)/(tmax-tmin));
b2r = nchoosek(4,2)*((tmax-t1)/(tmax-tmin)).^2.*((t1-tmin)/(tmax-tmin)).^2;
b3r = nchoosek(4,3)*((tmax-t1)/(tmax-tmin)).*((t1-tmin)/(tmax-tmin)).^3;
b4r = nchoosek(4,4)*((t1-tmin)/(tmax-tmin)).^4;


x2 = x(1)*b0r + x(2)*b1r + x(3)*b2r + x(4)*b3r + x(5)*b4r; %curva de bezier componente x 
y2 = y(1)*b0r + y(2)*b1r + y(3)*b2r + y(4)*b3r + y(5)*b4r; %curva de bezier componente y

hold on ;
grid on;
plot(x2,y2,'k')

%subdivision de la curva [-2,-1.5]
ts = -1.5; %intervalo de subdivision

tau = (ts-tmin)/(tmax-tmin); 

P = zeros(4); 

for i = 1:1:4
    
    j = i+1;
    
    Px = (1-tau)*x(i)+tau*x(j)
    Py = (1-tau)*y(i)+tau*y(j)
    
    plot(Px,Py,'o') 
    
    Px2 = (1-tau)*Px+tau*Px;
    Py2 = (1-tau)*Py+tau*Py;
    
    plot(Px2,Py2,'o')
    
end


