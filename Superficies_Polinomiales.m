clear
clc 

% Plano dado parametricamente
[u,v] = meshgrid(0:.1:1);

% Coeficientes 
a00 = [1 2 3]; 
a10 = [2 3 1];
a01 = [3 2 1]; 


% Plano 
x = a00(1,1) + a10(1,1).*u + a01(1,1).*v; 
y = a00(1,2) + a10(1,2).*u + a01(1,2).*v; 
z = a00(1,3) + a10(1,3).*u + a01(1,3).*v; 


figure('Name','Plano')
hold on 
surf(x,y,z)
grid on 
