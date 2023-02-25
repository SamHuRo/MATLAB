clear 
clc


%definicion de la variable t 
t = 0:.01:1;


%definicio de  las funciones de Overhauser 
f0= -(.5)*t + t.^2 -(.5)*t.^3;
f1= 1-(5/2)*t.^2 +(3/2)*t.^3;
f2= (.5)*t + 2*t.^2 - (3/2)*t.^3;
f3= -(.5)*t.^2 + (.5)*t.^3; 



%puntos de la fractura 
load('sec9.mat')

figure
for i = 0:6 
    frac = sec((i*20)+1:20*(i+1),1:3);
    plot3(frac(:,1),frac(:,2),frac(:,3),'-o') 
    hold on, grid on 
    
    
%definicion de variables
s = size(frac); 
n = s(1); %cantidad de puntos
c = 7; %cantidad de grupos de puntos 
pb = 4; %cantidad de puntos de Bézier 


    for i1=1:1:n
            k = i1+1;
            j =i1+2; 
            q = i1+3; 
    
    
        if k > n
          k = i1-(n-1);
        end 
         if j > n
          j = i1-(n-2);
         end 
      
        if q > n
          q = i1-(n-3);
        end 

   %la curva de Overhauser aparece en el segundo punto   
        x1= frac(i1,1)*f0 + frac(k,1)*f1 + frac(j,1)*f2 + frac(q,1)*f3;
        y1= frac(i1,2)*f0 + frac(k,2)*f1 + frac(j,2)*f2 + frac(q,2)*f3;
        z1= frac(i1,3)*f0 + frac(k,3)*f1 + frac(j,3)*f2 + frac(q,3)*f3;
        
        hold on 
        plot3(x1,y1,z1,'k')
    end
    
end 




figure 
%sacar grupos de 20 puntos 
frac1 = sec(1:20,1:3);  
frac2 = sec(21:40,1:3);
frac3 = sec(41:60,1:3); 
frac4 = sec(61:80,1:3);  
frac5 = sec(81:100,1:3);  
frac6 = sec(101:120,1:3);  
frac7 = sec(121:140,1:3);  
plot3(frac1(:,1),frac1(:,2),frac1(:,3),'-o',frac2(:,1),frac2(:,2),frac2(:,3),'-o')
hold on 
plot3(frac3(:,1),frac3(:,2),frac3(:,3),'-o',frac4(:,1),frac4(:,2),frac4(:,3),'-o')
hold on 
plot3(frac5(:,1),frac5(:,2),frac5(:,3),'-o',frac6(:,1),frac6(:,2),frac6(:,3),'-o')
hold on 
plot3(frac7(:,1),frac7(:,2),frac7(:,3),'-o')
grid on 
title('Fractura'),xlabel('Eje x'),ylabel('Eje y'),zlabel('Eje z')


%splin periodico 
for i=1:1:n
    k = i+1;
    j =i+2; 
    q = i+3; 
    
    
     if k > n
          k = i-(n-1);
     end 
      if j > n
          j = i-(n-2);
      end 
      
      if q > n
          q = i-(n-3);
      end 

   %la curva de Overhauser aparece en el segundo punto   
    x1= frac1(i,1)*f0 + frac1(k,1)*f1 + frac1(j,1)*f2 + frac1(q,1)*f3;
    y1= frac1(i,2)*f0 + frac1(k,2)*f1 + frac1(j,2)*f2 + frac1(q,2)*f3;
    z1= frac1(i,3)*f0 + frac1(k,3)*f1 + frac1(j,3)*f2 + frac1(q,3)*f3;
    
    
    x2= frac2(i,1)*f0 + frac2(k,1)*f1 + frac2(j,1)*f2 + frac2(q,1)*f3;
    y2= frac2(i,2)*f0 + frac2(k,2)*f1 + frac2(j,2)*f2 + frac2(q,2)*f3;
    z2= frac2(i,3)*f0 + frac2(k,3)*f1 + frac2(j,3)*f2 + frac2(q,3)*f3;
    
    
    x3= frac3(i,1)*f0 + frac3(k,1)*f1 + frac3(j,1)*f2 + frac3(q,1)*f3;
    y3= frac3(i,2)*f0 + frac3(k,2)*f1 + frac3(j,2)*f2 + frac3(q,2)*f3;
    z3= frac3(i,3)*f0 + frac3(k,3)*f1 + frac3(j,3)*f2 + frac3(q,3)*f3;    
    
    
    x4= frac4(i,1)*f0 + frac4(k,1)*f1 + frac4(j,1)*f2 + frac4(q,1)*f3;
    y4= frac4(i,2)*f0 + frac4(k,2)*f1 + frac4(j,2)*f2 + frac4(q,2)*f3;
    z4= frac4(i,3)*f0 + frac4(k,3)*f1 + frac4(j,3)*f2 + frac4(q,3)*f3;    
    
    
    x5= frac5(i,1)*f0 + frac5(k,1)*f1 + frac5(j,1)*f2 + frac5(q,1)*f3;
    y5= frac5(i,2)*f0 + frac5(k,2)*f1 + frac5(j,2)*f2 + frac5(q,2)*f3;
    z5= frac5(i,3)*f0 + frac5(k,3)*f1 + frac5(j,3)*f2 + frac5(q,3)*f3;    
    
    
    x6= frac6(i,1)*f0 + frac6(k,1)*f1 + frac6(j,1)*f2 + frac6(q,1)*f3;
    y6= frac6(i,2)*f0 + frac6(k,2)*f1 + frac6(j,2)*f2 + frac6(q,2)*f3;
    z6= frac6(i,3)*f0 + frac6(k,3)*f1 + frac6(j,3)*f2 + frac6(q,3)*f3;   
    
    
    x7= frac7(i,1)*f0 + frac7(k,1)*f1 + frac7(j,1)*f2 + frac7(q,1)*f3;
    y7= frac7(i,2)*f0 + frac7(k,2)*f1 + frac7(j,2)*f2 + frac7(q,2)*f3;
    z7= frac7(i,3)*f0 + frac7(k,3)*f1 + frac7(j,3)*f2 + frac7(q,3)*f3;    
    
    
    hold on 
    plot3(x1,y1,z1,'k')
    hold on 
    plot3(x2,y2,z2,'k')
    hold on 
    plot3(x3,y3,z3,'k')
    hold on 
    plot3(x4,y4,z4,'k')    
    hold on 
    plot3(x5,y5,z5,'k')    
    hold on 
    plot3(x6,y6,z6,'k')   
    hold on 
    plot3(x7,y7,z7,'k')    
  
end

%definicion de la mtriz donde voy a guardar los puntos:
M1 = [];
M2 = [];
M3 = [];
M4 = [];
M5 = [];
M6 = [];
M7 = []; 
N = n * c * pb; %cantidad de ceros de la matriz que guarda los puntos de Bézier 
M = zeros(3,N); %matriz donde se guardan los puntos 3xN
vc = 1:(c*pb): N; %intervalo del vector entre puntos de la matriz M 
% v = [1 29 57 85 113 141 169 197 225 253 281 309 337 365 393 421 449 477 505 533 ];

% coeficientes de la fucion f(t) 

for i=1:1:n 
    k = i+1;
    j = i+2; 
    q = i+3; 
    i1 = vc(i); 
    
     if k > n
          k = i-(n-1);
     end 
      if j > n
          j = i-(n-2);
      end 
      
      if q > n
          q = i-(n-3);
      end 
    
    %para el primer grupo de datos 
    p0x = frac1(k,1); 
    p1x = (frac1(j,1)/2) - (frac1(i,1)/2);
    p2x = frac1(i,1) - (5*frac1(k,1)/2) + (2*frac1(j,1)) - (frac1(q,1)/2);
    p3x = (3*frac1(k,1)/2) - (frac1(i,1)/2) - (3*frac1(j,1)/2) + (frac1(q,1)/2); 

    p0y = frac1(k,2); 
    p1y = (frac1(j,2)/2) - (frac1(i,2)/2);
    p2y = frac1(i,2) - (5*frac1(k,2)/2) + (2*frac1(j,2)) - (frac1(q,2)/2);
    p3y = (3*frac1(k,2)/2) - (frac1(i,2)/2) - (3*frac1(j,2)/2) + (frac1(q,2)/2);

    p0z = frac1(k,3); 
    p1z = (frac1(j,3)/2) - (frac1(i,3)/2);
    p2z = frac1(i,3) - (5*frac1(k,3)/2) + (2*frac1(j,3)) - (frac1(q,3)/2);
    p3z = (3*frac1(k,3)/2) - (frac1(i,3)/2) - (3*frac1(j,3)/2) + (frac1(q,3)/2);
    
    n1 = 3; %dimencion del polinomio de Bézier 
    
    %calcular los componentes bixn, biyn, bizn: 
    
    %componente x: 
    b0x0 = p0x/nchoosek(n1,0);
    b1x0 = p1x/nchoosek(n1,1);
    b2x0 = p2x/nchoosek(n1,2);
    b3x0 = p3x/nchoosek(n1,3);

    b0x1 = b1x0 + b0x0; 
    b1x1 = b2x0 + b1x0; 
    b2x1 = b3x0 + b2x0; 

    b0x2 = b1x1 + b0x1; 
    b1x2 = b2x1 + b1x1; 

    b0x3 = b0x2 + b1x2; 
    
    %componente y: 
    b0y0 = p0y/nchoosek(n1,0);
    b1y0 = p1y/nchoosek(n1,1);
    b2y0 = p2y/nchoosek(n1,2);
    b3y0 = p3y/nchoosek(n1,3);

    b0y1 = b1y0 + b0y0; 
    b1y1 = b2y0 + b1y0; 
    b2y1 = b3y0 + b2y0; 

    b0y2 = b1y1 + b0y1; 
    b1y2 = b2y1 + b1y1; 

    b0y3 = b0y2 + b1y2; 
    
    %componente z: 
    b0z0 = p0z/nchoosek(n1,0);
    b1z0 = p1z/nchoosek(n1,1);
    b2z0 = p2z/nchoosek(n1,2);
    b3z0 = p3z/nchoosek(n1,3);

    b0z1 = b1z0 + b0z0; 
    b1z1 = b2z0 + b1z0; 
    b2z1 = b3z0 + b2z0; 

    b0z2 = b1z1 + b0z1; 
    b1z2 = b2z1 + b1z1; 

    b0z3 = b0z2 + b1z2; 
    
    M1 = [b0x0 b0x1 b0x2 b0x3 ; b0y0 b0y1 b0y2 b0y3 ; b0z0 b0z1 b0z2 b0z3]; 
       
    M(1,i1) = b0x0; M(2,i1) = b0y0; M(3,i1) = b0z0;
    M(1,i1+1) = b0x1; M(2,i1+1) = b0y1; M(3,i1+1) = b0z1;
    M(1,i1+2) = b0x2; M(2,i1+2) = b0y2; M(3,i1+2) = b0z2;
    M(1,i1+3) = b0x3; M(2,i1+3) = b0y3; M(3,i1+3) = b0z3;
   
%     hold on 
%     plot3(M1(1,:),M1(2,:),M1(3,:),'-og')
    
    %segundo grupo de datos 
    p0x = frac2(k,1); 
    p1x = (frac2(j,1)/2) - (frac2(i,1)/2);
    p2x = frac2(i,1) - (5*frac2(k,1)/2) + (2*frac2(j,1)) - (frac2(q,1)/2);
    p3x = (3*frac2(k,1)/2) - (frac2(i,1)/2) - (3*frac2(j,1)/2) + (frac2(q,1)/2); 

    p0y = frac2(k,2); 
    p1y = (frac2(j,2)/2) - (frac2(i,2)/2);
    p2y = frac2(i,2) - (5*frac2(k,2)/2) + (2*frac2(j,2)) - (frac2(q,2)/2);
    p3y = (3*frac2(k,2)/2) - (frac2(i,2)/2) - (3*frac2(j,2)/2) + (frac2(q,2)/2);

    p0z = frac2(k,3); 
    p1z = (frac2(j,3)/2) - (frac2(i,3)/2);
    p2z = frac2(i,3) - (5*frac2(k,3)/2) + (2*frac2(j,3)) - (frac2(q,3)/2);
    p3z = (3*frac2(k,3)/2) - (frac2(i,3)/2) - (3*frac2(j,3)/2) + (frac2(q,3)/2);
    
    %componente x: 
    b0x0 = p0x/nchoosek(n1,0);
    b1x0 = p1x/nchoosek(n1,1);
    b2x0 = p2x/nchoosek(n1,2);
    b3x0 = p3x/nchoosek(n1,3);

    b0x1 = b1x0 + b0x0; 
    b1x1 = b2x0 + b1x0; 
    b2x1 = b3x0 + b2x0; 

    b0x2 = b1x1 + b0x1; 
    b1x2 = b2x1 + b1x1; 

    b0x3 = b0x2 + b1x2; 
    
    %componente y: 
    b0y0 = p0y/nchoosek(n1,0);
    b1y0 = p1y/nchoosek(n1,1);
    b2y0 = p2y/nchoosek(n1,2);
    b3y0 = p3y/nchoosek(n1,3);

    b0y1 = b1y0 + b0y0; 
    b1y1 = b2y0 + b1y0; 
    b2y1 = b3y0 + b2y0; 

    b0y2 = b1y1 + b0y1; 
    b1y2 = b2y1 + b1y1; 

    b0y3 = b0y2 + b1y2; 
    
    %componente z: 
    b0z0 = p0z/nchoosek(n1,0);
    b1z0 = p1z/nchoosek(n1,1);
    b2z0 = p2z/nchoosek(n1,2);
    b3z0 = p3z/nchoosek(n1,3);

    b0z1 = b1z0 + b0z0; 
    b1z1 = b2z0 + b1z0; 
    b2z1 = b3z0 + b2z0; 

    b0z2 = b1z1 + b0z1; 
    b1z2 = b2z1 + b1z1; 

    b0z3 = b0z2 + b1z2; 
    
    M2 = [b0x0 b0x1 b0x2 b0x3 ; b0y0 b0y1 b0y2 b0y3 ; b0z0 b0z1 b0z2 b0z3 ]; 
    
    M(1,i1+4) = b0x0; M(2,i1+4) = b0y0; M(3,i1+4) = b0z0;
    M(1,i1+5) = b0x1; M(2,i1+5) = b0y1; M(3,i1+5) = b0z1;
    M(1,i1+6) = b0x2; M(2,i1+6) = b0y2; M(3,i1+6) = b0z2;
    M(1,i1+7) = b0x3; M(2,i1+7) = b0y3; M(3,i1+7) = b0z3;
    
%     hold on 
%     plot3(M2(1,:),M2(2,:),M2(3,:),'-og')
    
    %tercer grupo de datos 
    p0x = frac3(k,1); 
    p1x = (frac3(j,1)/2) - (frac3(i,1)/2);
    p2x = frac3(i,1) - (5*frac3(k,1)/2) + (2*frac3(j,1)) - (frac3(q,1)/2);
    p3x = (3*frac3(k,1)/2) - (frac3(i,1)/2) - (3*frac3(j,1)/2) + (frac3(q,1)/2); 

    p0y = frac3(k,2); 
    p1y = (frac3(j,2)/2) - (frac3(i,2)/2);
    p2y = frac3(i,2) - (5*frac3(k,2)/2) + (2*frac3(j,2)) - (frac3(q,2)/2);
    p3y = (3*frac3(k,2)/2) - (frac3(i,2)/2) - (3*frac3(j,2)/2) + (frac3(q,2)/2);

    p0z = frac3(k,3); 
    p1z = (frac3(j,3)/2) - (frac3(i,3)/2);
    p2z = frac3(i,3) - (5*frac3(k,3)/2) + (2*frac3(j,3)) - (frac3(q,3)/2);
    p3z = (3*frac3(k,3)/2) - (frac3(i,3)/2) - (3*frac3(j,3)/2) + (frac3(q,3)/2);
    
    %componente x: 
    b0x0 = p0x/nchoosek(n1,0);
    b1x0 = p1x/nchoosek(n1,1);
    b2x0 = p2x/nchoosek(n1,2);
    b3x0 = p3x/nchoosek(n1,3);

    b0x1 = b1x0 + b0x0; 
    b1x1 = b2x0 + b1x0; 
    b2x1 = b3x0 + b2x0; 

    b0x2 = b1x1 + b0x1; 
    b1x2 = b2x1 + b1x1; 

    b0x3 = b0x2 + b1x2; 
    
    %componente y: 
    b0y0 = p0y/nchoosek(n1,0);
    b1y0 = p1y/nchoosek(n1,1);
    b2y0 = p2y/nchoosek(n1,2);
    b3y0 = p3y/nchoosek(n1,3);

    b0y1 = b1y0 + b0y0; 
    b1y1 = b2y0 + b1y0; 
    b2y1 = b3y0 + b2y0; 

    b0y2 = b1y1 + b0y1; 
    b1y2 = b2y1 + b1y1; 

    b0y3 = b0y2 + b1y2; 
    
    %componente z: 
    b0z0 = p0z/nchoosek(n1,0);
    b1z0 = p1z/nchoosek(n1,1);
    b2z0 = p2z/nchoosek(n1,2);
    b3z0 = p3z/nchoosek(n1,3);

    b0z1 = b1z0 + b0z0; 
    b1z1 = b2z0 + b1z0; 
    b2z1 = b3z0 + b2z0; 

    b0z2 = b1z1 + b0z1; 
    b1z2 = b2z1 + b1z1; 

    b0z3 = b0z2 + b1z2; 
    
    M3 = [b0x0 b0x1 b0x2 b0x3 ; b0y0 b0y1 b0y2 b0y3 ; b0z0 b0z1 b0z2 b0z3 ]; 
    
    M(1,i1+8) = b0x0; M(2,i1+8) = b0y0; M(3,i1+8) = b0z0;
    M(1,i1+9) = b0x1; M(2,i1+9) = b0y1; M(3,i1+9) = b0z1;
    M(1,i1+10) = b0x2; M(2,i1+10) = b0y2; M(3,i1+10) = b0z2;
    M(1,i1+11) = b0x3; M(2,i1+11) = b0y3; M(3,i1+11) = b0z3;
    
%     hold on 
%     plot3(M3(1,:),M3(2,:),M3(3,:),'-og')
    
    %cuarto grupo de datos; 
    p0x = frac4(k,1); 
    p1x = (frac4(j,1)/2) - (frac4(i,1)/2);
    p2x = frac4(i,1) - (5*frac4(k,1)/2) + (2*frac4(j,1)) - (frac4(q,1)/2);
    p3x = (3*frac4(k,1)/2) - (frac4(i,1)/2) - (3*frac4(j,1)/2) + (frac4(q,1)/2); 

    p0y = frac4(k,2); 
    p1y = (frac4(j,2)/2) - (frac4(i,2)/2);
    p2y = frac4(i,2) - (5*frac4(k,2)/2) + (2*frac4(j,2)) - (frac4(q,2)/2);
    p3y = (3*frac4(k,2)/2) - (frac4(i,2)/2) - (3*frac4(j,2)/2) + (frac4(q,2)/2);

    p0z = frac4(k,3); 
    p1z = (frac4(j,3)/2) - (frac4(i,3)/2);
    p2z = frac4(i,3) - (5*frac4(k,3)/2) + (2*frac4(j,3)) - (frac4(q,3)/2);
    p3z = (3*frac4(k,3)/2) - (frac4(i,3)/2) - (3*frac4(j,3)/2) + (frac4(q,3)/2);
    
    %componente x: 
    b0x0 = p0x/nchoosek(n1,0);
    b1x0 = p1x/nchoosek(n1,1);
    b2x0 = p2x/nchoosek(n1,2);
    b3x0 = p3x/nchoosek(n1,3);

    b0x1 = b1x0 + b0x0; 
    b1x1 = b2x0 + b1x0; 
    b2x1 = b3x0 + b2x0; 

    b0x2 = b1x1 + b0x1; 
    b1x2 = b2x1 + b1x1; 

    b0x3 = b0x2 + b1x2; 
    
    %componente y: 
    b0y0 = p0y/nchoosek(n1,0);
    b1y0 = p1y/nchoosek(n1,1);
    b2y0 = p2y/nchoosek(n1,2);
    b3y0 = p3y/nchoosek(n1,3);

    b0y1 = b1y0 + b0y0; 
    b1y1 = b2y0 + b1y0; 
    b2y1 = b3y0 + b2y0; 

    b0y2 = b1y1 + b0y1; 
    b1y2 = b2y1 + b1y1; 

    b0y3 = b0y2 + b1y2; 
    
    %componente z: 
    b0z0 = p0z/nchoosek(n1,0);
    b1z0 = p1z/nchoosek(n1,1);
    b2z0 = p2z/nchoosek(n1,2);
    b3z0 = p3z/nchoosek(n1,3);

    b0z1 = b1z0 + b0z0; 
    b1z1 = b2z0 + b1z0; 
    b2z1 = b3z0 + b2z0; 

    b0z2 = b1z1 + b0z1; 
    b1z2 = b2z1 + b1z1; 

    b0z3 = b0z2 + b1z2; 
    
    M4 = [b0x0 b0x1 b0x2 b0x3 ; b0y0 b0y1 b0y2 b0y3 ; b0z0 b0z1 b0z2 b0z3 ];
    
    M(1,i1+12) = b0x0; M(2,i1+12) = b0y0; M(3,i1+12) = b0z0;
    M(1,i1+13) = b0x1; M(2,i1+13) = b0y1; M(3,i1+13) = b0z1;
    M(1,i1+14) = b0x2; M(2,i1+14) = b0y2; M(3,i1+14) = b0z2;
    M(1,i1+15) = b0x3; M(2,i1+15) = b0y3; M(3,i1+15) = b0z3;
    
%     hold on 
%     plot3(M4(1,:),M4(2,:),M4(3,:),'-og')
    
    %quinto grupo de datos:
    p0x =frac5(k,1); 
    p1x = (frac5(j,1)/2) - (frac5(i,1)/2);
    p2x =frac5(i,1) - (5*frac5(k,1)/2) + (2*frac5(j,1)) - (frac5(q,1)/2);
    p3x = (3*frac5(k,1)/2) - (frac5(i,1)/2) - (3*frac5(j,1)/2) + (frac5(q,1)/2); 

    p0y =frac5(k,2); 
    p1y = (frac5(j,2)/2) - (frac5(i,2)/2);
    p2y =frac5(i,2) - (5*frac5(k,2)/2) + (2*frac5(j,2)) - (frac5(q,2)/2);
    p3y = (3*frac5(k,2)/2) - (frac5(i,2)/2) - (3*frac5(j,2)/2) + (frac5(q,2)/2);

    p0z =frac5(k,3); 
    p1z = (frac5(j,3)/2) - (frac5(i,3)/2);
    p2z =frac5(i,3) - (5*frac5(k,3)/2) + (2*frac5(j,3)) - (frac5(q,3)/2);
    p3z = (3*frac5(k,3)/2) - (frac5(i,3)/2) - (3*frac5(j,3)/2) + (frac5(q,3)/2);
    
    %componente x: 
    b0x0 = p0x/nchoosek(n1,0);
    b1x0 = p1x/nchoosek(n1,1);
    b2x0 = p2x/nchoosek(n1,2);
    b3x0 = p3x/nchoosek(n1,3);

    b0x1 = b1x0 + b0x0; 
    b1x1 = b2x0 + b1x0; 
    b2x1 = b3x0 + b2x0; 

    b0x2 = b1x1 + b0x1; 
    b1x2 = b2x1 + b1x1; 

    b0x3 = b0x2 + b1x2; 
    
    %componente y: 
    b0y0 = p0y/nchoosek(n1,0);
    b1y0 = p1y/nchoosek(n1,1);
    b2y0 = p2y/nchoosek(n1,2);
    b3y0 = p3y/nchoosek(n1,3);

    b0y1 = b1y0 + b0y0; 
    b1y1 = b2y0 + b1y0; 
    b2y1 = b3y0 + b2y0; 

    b0y2 = b1y1 + b0y1; 
    b1y2 = b2y1 + b1y1; 

    b0y3 = b0y2 + b1y2; 
    
    %componente z: 
    b0z0 = p0z/nchoosek(n1,0);
    b1z0 = p1z/nchoosek(n1,1);
    b2z0 = p2z/nchoosek(n1,2);
    b3z0 = p3z/nchoosek(n1,3);

    b0z1 = b1z0 + b0z0; 
    b1z1 = b2z0 + b1z0; 
    b2z1 = b3z0 + b2z0; 

    b0z2 = b1z1 + b0z1; 
    b1z2 = b2z1 + b1z1; 

    b0z3 = b0z2 + b1z2; 
    
    M5 = [b0x0 b0x1 b0x2 b0x3 ; b0y0 b0y1 b0y2 b0y3 ; b0z0 b0z1 b0z2 b0z3 ]; 
    
    M(1,i1+16) = b0x0; M(2,i1+16) = b0y0; M(3,i1+16) = b0z0;
    M(1,i1+17) = b0x1; M(2,i1+17) = b0y1; M(3,i1+17) = b0z1;
    M(1,i1+18) = b0x2; M(2,i1+18) = b0y2; M(3,i1+18) = b0z2;
    M(1,i1+19) = b0x3; M(2,i1+19) = b0y3; M(3,i1+19) = b0z3;
    
%     hold on 
%     plot3(M5(1,:),M5(2,:),M5(3,:),'-og')
    
    %sexto grupo de datos: 
    p0x =frac6(k,1); 
    p1x = (frac6(j,1)/2) - (frac6(i,1)/2);
    p2x =frac6(i,1) - (5*frac6(k,1)/2) + (2*frac6(j,1)) - (frac6(q,1)/2);
    p3x = (3*frac6(k,1)/2) - (frac6(i,1)/2) - (3*frac6(j,1)/2) + (frac6(q,1)/2); 

    p0y =frac6(k,2); 
    p1y = (frac6(j,2)/2) - (frac6(i,2)/2);
    p2y =frac6(i,2) - (5*frac6(k,2)/2) + (2*frac6(j,2)) - (frac6(q,2)/2);
    p3y = (3*frac6(k,2)/2) - (frac6(i,2)/2) - (3*frac6(j,2)/2) + (frac6(q,2)/2);

    p0z =frac6(k,3); 
    p1z = (frac6(j,3)/2) - (frac6(i,3)/2);
    p2z =frac6(i,3) - (5*frac6(k,3)/2) + (2*frac6(j,3)) - (frac6(q,3)/2);
    p3z = (3*frac6(k,3)/2) - (frac6(i,3)/2) - (3*frac6(j,3)/2) + (frac6(q,3)/2);
    
    %componente x: 
    b0x0 = p0x/nchoosek(n1,0);
    b1x0 = p1x/nchoosek(n1,1);
    b2x0 = p2x/nchoosek(n1,2);
    b3x0 = p3x/nchoosek(n1,3);

    b0x1 = b1x0 + b0x0; 
    b1x1 = b2x0 + b1x0; 
    b2x1 = b3x0 + b2x0; 

    b0x2 = b1x1 + b0x1; 
    b1x2 = b2x1 + b1x1; 

    b0x3 = b0x2 + b1x2; 
    
    %componente y: 
    b0y0 = p0y/nchoosek(n1,0);
    b1y0 = p1y/nchoosek(n1,1);
    b2y0 = p2y/nchoosek(n1,2);
    b3y0 = p3y/nchoosek(n1,3);

    b0y1 = b1y0 + b0y0; 
    b1y1 = b2y0 + b1y0; 
    b2y1 = b3y0 + b2y0; 

    b0y2 = b1y1 + b0y1; 
    b1y2 = b2y1 + b1y1; 

    b0y3 = b0y2 + b1y2; 
    
    %componente z: 
    b0z0 = p0z/nchoosek(n1,0);
    b1z0 = p1z/nchoosek(n1,1);
    b2z0 = p2z/nchoosek(n1,2);
    b3z0 = p3z/nchoosek(n1,3);

    b0z1 = b1z0 + b0z0; 
    b1z1 = b2z0 + b1z0; 
    b2z1 = b3z0 + b2z0; 

    b0z2 = b1z1 + b0z1; 
    b1z2 = b2z1 + b1z1; 

    b0z3 = b0z2 + b1z2; 
    
    M6 = [b0x0 b0x1 b0x2 b0x3 ; b0y0 b0y1 b0y2 b0y3 ; b0z0 b0z1 b0z2 b0z3 ]; 
    
    M(1,i1+20) = b0x0; M(2,i1+20) = b0y0; M(3,i1+20) = b0z0;
    M(1,i1+21) = b0x1; M(2,i1+21) = b0y1; M(3,i1+21) = b0z1;
    M(1,i1+22) = b0x2; M(2,i1+22) = b0y2; M(3,i1+22) = b0z2;
    M(1,i1+23) = b0x3; M(2,i1+23) = b0y3; M(3,i1+23) = b0z3;
    
%     hold on 
%     plot3(M6(1,:),M6(2,:),M6(3,:),'-og')  
    
    %septimo grupo de datos: 
    p0x =frac7(k,1); 
    p1x = (frac7(j,1)/2) - (frac7(i,1)/2);
    p2x =frac7(i,1) - (5*frac7(k,1)/2) + (2*frac7(j,1)) - (frac7(q,1)/2);
    p3x = (3*frac7(k,1)/2) - (frac7(i,1)/2) - (3*frac7(j,1)/2) + (frac7(q,1)/2); 

    p0y =frac7(k,2); 
    p1y = (frac7(j,2)/2) - (frac7(i,2)/2);
    p2y =frac7(i,2) - (5*frac7(k,2)/2) + (2*frac7(j,2)) - (frac7(q,2)/2);
    p3y = (3*frac7(k,2)/2) - (frac7(i,2)/2) - (3*frac7(j,2)/2) + (frac7(q,2)/2);

    p0z =frac7(k,3); 
    p1z = (frac7(j,3)/2) - (frac7(i,3)/2);
    p2z =frac7(i,3) - (5*frac7(k,3)/2) + (2*frac7(j,3)) - (frac7(q,3)/2);
    p3z = (3*frac7(k,3)/2) - (frac7(i,3)/2) - (3*frac7(j,3)/2) + (frac7(q,3)/2);
    
    %componente x: 
    b0x0 = p0x/nchoosek(n1,0);
    b1x0 = p1x/nchoosek(n1,1);
    b2x0 = p2x/nchoosek(n1,2);
    b3x0 = p3x/nchoosek(n1,3);

    b0x1 = b1x0 + b0x0; 
    b1x1 = b2x0 + b1x0; 
    b2x1 = b3x0 + b2x0; 

    b0x2 = b1x1 + b0x1; 
    b1x2 = b2x1 + b1x1; 

    b0x3 = b0x2 + b1x2; 
    
    %componente y: 
    b0y0 = p0y/nchoosek(n1,0);
    b1y0 = p1y/nchoosek(n1,1);
    b2y0 = p2y/nchoosek(n1,2);
    b3y0 = p3y/nchoosek(n1,3);

    b0y1 = b1y0 + b0y0; 
    b1y1 = b2y0 + b1y0; 
    b2y1 = b3y0 + b2y0; 

    b0y2 = b1y1 + b0y1; 
    b1y2 = b2y1 + b1y1; 

    b0y3 = b0y2 + b1y2; 
    
    %componente z: 
    b0z0 = p0z/nchoosek(n1,0);
    b1z0 = p1z/nchoosek(n1,1);
    b2z0 = p2z/nchoosek(n1,2);
    b3z0 = p3z/nchoosek(n1,3);

    b0z1 = b1z0 + b0z0; 
    b1z1 = b2z0 + b1z0; 
    b2z1 = b3z0 + b2z0; 

    b0z2 = b1z1 + b0z1; 
    b1z2 = b2z1 + b1z1; 

    b0z3 = b0z2 + b1z2; 
    
    M7 = [b0x0 b0x1 b0x2 b0x3 ; b0y0 b0y1 b0y2 b0y3 ; b0z0 b0z1 b0z2 b0z3 ]; 
    
    M(1,i1+24) = b0x0; M(2,i1+24) = b0y0; M(3,i1+24) = b0z0;
    M(1,i1+25) = b0x1; M(2,i1+25) = b0y1; M(3,i1+25) = b0z1;
    M(1,i1+26) = b0x2; M(2,i1+26) = b0y2; M(3,i1+26) = b0z2;
    M(1,i1+27) = b0x3; M(2,i1+27) = b0y3; M(3,i1+27) = b0z3;
    
    hold on 
%     plot3(M7(1,:),M7(2,:),M7(3,:),'-og')      
end 

plot3(M(1,:),M(2,:),M(3,:),'-ob')

