figure 
hold on 
[x,y] = meshgrid(0:0.02:1);
z = rand()*x + rand()*y;
xp = x + 0.1*(rand(length(x))-.5);
yp = y + 0.1*(rand(length(y))-.5);
zp = z + 0.1*(rand(length(z))-.5);
x = xp(:);
y = yp(:);
z = zp(:);
plot3(x,y,z,'ro')
zlim([-.2,1.2]);
xlabel('x')
ylabel('y')
% Se calcula el centro para ubicar los vectores
xm = mean(x);
ym = mean(y);
zm = mean(z);
% Calcular los vectores que tienen el mejor fitting 
hold on 
U = pca([x,y,z]);
% Desplegar los vectores 
quiver3(xm,ym,zm,U(1,2),U(2,2),U(3,2),'LineWidth',3)
quiver3(xm,ym,zm,U(1,1),U(2,1),U(3,1),'LineWidth',3)


