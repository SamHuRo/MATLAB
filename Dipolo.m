hold on
%equipotenciales 
for V=1:5
    ang=(-90:1:90)*pi/180;
    r=sqrt(cos(ang)/V);
    x=r.*cos(ang);
    y=r.*sin(ang);
    plot(x,y);
end
%campo eléctrico  en los puntos de esta malla
[X,Y]=meshgrid(0.2:0.1:1,-0.7:0.1:0.7);
r=sqrt(X.^2+Y.^2);
ang=atan(Y./X);
Er=2*cos(ang)./r.^3; %componentes polares
Ea=sin(ang)./r.^3;
Ex=Er.*cos(ang)-Ea.*sin(ang); %componentes rectangulares
Ey=Er.*sin(ang)+Ea.*cos(ang);
quiver(X,Y,Ex,Ey)
hold off
axis equal
xlabel('x')
ylabel('y')
title('Dipolo eléctrico')