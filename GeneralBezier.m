clear 
clc

% Paraetro t 
t = 0:.01:1;
% Definicion de los puntos de control 
V=[1 2 4 ;1 3 -1 ; 1 2 3 ];
% Poligono de control 
figure(1)
plot3(V(1,:),V(2,:),V(3,:),'-o'), grid on 
 
a = size(V); 
n = a(2); % Grado del polinomio
s = size(t);
m = s(2);
x = zeros(n,m);
y = zeros(n,m);
z = zeros(n,m);

% construccion de la curva de Bezier 

for i=1:n 
    for i1=0:m
    x(i,i1) = V(1,i).*nchoosek(n,i1).*((1-t).^(n-i1)).*(t.^i1);
    y(i,i1) = V(2,i).*nchoosek(n,i1).*((1-t).^(n-i1)).*(t.^i1);
    z(i,i1) = V(3,i).*nchoosek(n,i1).*((1-t).^(n-i1)).*(t.^i1);
    end
end

hold on 
plot3(x,y,z)

