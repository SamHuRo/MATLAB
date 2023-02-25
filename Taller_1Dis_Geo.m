clear all 
clc
%%%Punto 1 y 2 
%definicion de la variable 
t=0:.01:1;


%puntos de control 
P0 = [0,0];
P1 = [1,3];
P2 = [3,4];
P3 = [6,5];
P4 = [5,6];

V =[ P0' P1' P2' P3' P4'];
figure(1);
plot(V(1,:),V(2,:),'-o'); %poligono de control 

%polinomis de Bernstein 
b0 = (1-t).^4;
b1 = nchoosek(4,1)*(1-t).^3.*t;
b2 = nchoosek(4,2)*(1-t).^2.*t.^2;
b3 = nchoosek(4,3)*(1-t).*t.^3;
b4 = nchoosek(4,4)*t.^4;


x = P0(1)*b0 + P1(1)*b1 + P2(1)*b2 + P3(1)*b3 + P4(1)*b4; %curva de bezier componente x 
y = P0(2)*b0 + P1(2)*b1 + P2(2)*b2 + P3(2)*b3 + P4(2)*b4; %curva de bezier componente y

hold on 
plot(x,y), grid on;

%% Punto 3
%reparametrizar la curva de Bezir en [-2,2]
tmin = -2;
tmax = 2;
t1 = tmin:.01:tmax; %nuevo intervalo 

figure(2);
plot(V(1,:),V(2,:),'-o');

definicion de los nuevos polinomis de bernstein en el nuevo intervalo

b0r = ((tmax-t1)/(tmax-tmin)).^4;
b1r = nchoosek(4,1)*((tmax-t1)/(tmax-tmin)).^3.*((t1-tmin)/(tmax-tmin));
b2r = nchoosek(4,2)*((tmax-t1)/(tmax-tmin)).^2.*((t1-tmin)/(tmax-tmin)).^2;
b3r = nchoosek(4,3)*((tmax-t1)/(tmax-tmin)).*((t1-tmin)/(tmax-tmin)).^3;
b4r = nchoosek(4,4)*((t1-tmin)/(tmax-tmin)).^4;


x1 = P0(1)*b0r + P1(1)*b1r + P2(1)*b2r + P3(1)*b3r + P4(1)*b4r; %curva de bezier componente x 
y1 = P0(2)*b0r + P1(2)*b1r + P2(2)*b2r + P3(2)*b3r + P4(2)*b4r; %curva de bezier componente y

hold on ;
plot(x1,y1), grid on ;



%%%Punto 4 
% para encntrar el valor de la curva en -1.5, tenemos que evaluar x1(-1.5)y
% y(-1.5)
t15=-1.5;
b0r5 = ((tmax-t15)/(tmax-tmin)).^4;
b1r5 = nchoosek(4,1)*((tmax-t15)/(tmax-tmin)).^3.*((t15-tmin)/(tmax-tmin));
b2r5 = nchoosek(4,2)*((tmax-t15)/(tmax-tmin)).^2.*((t15-tmin)/(tmax-tmin)).^2;
b3r5 = nchoosek(4,3)*((tmax-t15)/(tmax-tmin)).*((t15-tmin)/(tmax-tmin)).^3;
b4r5 = nchoosek(4,4)*((t15-tmin)/(tmax-tmin)).^4;

x15 = P0(1)*b0r5 + P1(1)*b1r5 + P2(1)*b2r5 + P3(1)*b3r5 + P4(1)*b4r5; %curva de bezier componente x evaluada en -1.5 
y15 = P0(2)*b0r5 + P1(2)*b1r5 + P2(2)*b2r5 + P3(2)*b3r5 + P4(2)*b4r5; %curva de bezier componente y evaluado en -1.5

figure(4)
plot(x15,y15,'o')

%%Punto 5
para hacer la subdivicion de la curva se dee de aplicar el algoritmo de
Casteljau 
[-2,-1.5]


%%%Punto 7 
%elevar de grado una curva de Bezier 
%pasar de un polinpmio de grado 4 a grado 5 
n  = 5; %el grado al cual se queire elevar 
%calcular el nuevo vertice 
for i = 0:n
    for k =1:5
    Dx = (i/n+1).*V(k,1) + (n+1-i)/(n+1).*V(k,1);
    end 
end 
plot(D)


%%%Punto 8 
%%verificar si una curva de bezier de grado dos yace en el plano generado
%%por sus puntos de control 

t2 = 0:.01:1;

%polinomios de bernstein grado 2 
b03 = nchoosek(2,0)*(1-t2).^2;
b13 = nchoosek(2,1)*(1-t2).*t2;
b23 = nchoosek(2,2)*t2.^2;

%definicion de los puntos de control 
P03 = [1,1,1];
P13 = [2,3,4];
P23 = [4,6,5];

V3 = [P03' P13' P23']; 

%definicion del plano que contiene los tres puntos 
A = P13 - P03;
B = P23 - P13; 

%definicion del plano 
[s,d] = meshgrid(-5:.5:5);
 x2 = P03(1) + s.*A(1) + d.*B(1);
 y2 = P03(2) + s.*A(2) + d.*B(2);
 z2 = P03(3) + s.*A(3) + d.*B(3);
 
figure(8);
plot3(V3(1,:),V3(2,:),V3(3,:),'-yo');
grid on ;
hold on ;
surf(x2,y2,z2);

%definicion de la curva de bezier 
x3 = P03(1)*b03 + P13(1)*b13 + P23(1)*b23;
y3 = P03(2)*b03 + P13(2)*b13 + P23(2)*b23;
z3 = P03(3)*b03 + P13(3)*b13 + P23(3)*b23;

plot3(x3,y3,z3);




