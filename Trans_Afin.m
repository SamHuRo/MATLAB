clear all 
clc


% Puntos 
V=[0 1 1 0 0;0 0 1 1 0];
figure(1)
title('Transformacion afin')
plot(V(1,:),V(2,:),'-o')

A=[1 0;0 1];%Matriz de la transformacion 
b=[1;2];%vector de la transformacion

%Transformacion afin 
fi = A*V +b;
hold on, grid on 
plot(fi(1,:),fi(2,:),'-o')
%rectificar el determinante 
det = det(A)
