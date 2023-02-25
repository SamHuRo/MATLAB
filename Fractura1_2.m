clear 
clc


% Definicion de la variable t 
t = 0:.01:1;


% Definicio de  las funciones de Overhauser 
f0= -(.5)*t + t.^2 -(.5)*t.^3;
f1= 1-(5/2)*t.^2 +(3/2)*t.^3;
f2= (.5)*t + 2*t.^2 - (3/2)*t.^3;
f3= -(.5)*t.^2 + (.5)*t.^3; 


% % Matriz de los puntos de Bézier, M(:,eje)
% M = [];
% V = []; 


% Matrices y vectores los cuales se van a utilizar para guardar los 
% puntos de Bézier
M1 = [];
s1 = 1:4:80;
s2 = 2:4:80;
s3 = 3:4:80;
s4 = 4:4:80; 
M2 = [];


% Descarga de los puntos que se utilizaran para encontrar las curvas de
% Overhauser 
load('sec9.mat')


figure('Name','Fracture')


% Cantidad de puntos por arreglo 
n = 20;

%%%%%-----Definición de las curvas de Overhauser-----%%%%%
for i = 0:6
    
% Puntos de control 
    frac = sec((i*n)+1:n*(i+1),1:3);
    plot3(frac(:,1),frac(:,2),frac(:,3),'--sb',...
        'MarkerEdgeColor','r',...
        'MarkerFaceColor',[1 .6 .6]) 
    hold on, grid on
    title('Plot of the fracture','FontSize',13)
    xlabel('x axis')
    ylabel('y axis')
    zlabel('z axis')
    
    
%Definicion de variables
s = size(frac); 
n1 = s(1); 


%Spline de Overhauser
    for i1=1:n1
            j = i1+1;
            k =i1+2; 
            q = i1+3; 
            
% Se sacan las componentes de las curvas Overhauser
    
        if j > n1
          j = i1-(n1-1);
        end 
         if k > n1
          k = i1-(n1-2);
         end 
      
        if q > n1
          q = i1-(n1-3);
        end 

        
%La curva de Overhauser aparece en el segundo punto   
        x= frac(i1,1)*f0 + frac(j,1)*f1 + frac(k,1)*f2 + frac(q,1)*f3;
        y= frac(i1,2)*f0 + frac(j,2)*f1 + frac(k,2)*f2 + frac(q,2)*f3;
        z= frac(i1,3)*f0 + frac(j,3)*f1 + frac(k,3)*f2 + frac(q,3)*f3;
        
% Plot de las curvas de Overhauser        
%         hold on 
%         plot3(x,y,z,'k','LineWidth',1.2)
        
    end

    
%Puntos de Bézier 
for i2 = 1:n1 
    k2 = i2+1;
    j2 = i2+2; 
    q2 = i2+3;
    e1 = s1(i2);
    e2 = s2(i2);
    e3 = s3(i2);
    e4 = s4(i2);
    
     if k2 > n1
          k2 = i2-(n1-1);
     end 
      if j2 > n1
          j2 = i2-(n1-2);
      end 
      
      if q2 > n1
          q2 = i2-(n1-3);
      end 
      
      
  for i3 = 1:3  
% En cada ciclo se guarda en la matriz M cada una de las coordenadas:
%          primer ciclo: coordenadas x
%          segundo ciclo: coordenadas y 
%          tercer ciclo: coordenadas z 
      
      
    n2 = 3;
      
    
    p0 = frac(k2,i3); 
    p1 = (frac(j2,i3)/2) - (frac(i2,i3)/2);
    p2 = frac(i2,i3) - (5*frac(k2,i3)/2) + (2*frac(j2,i3)) - (frac(q2,i3)/2);
    p3 = (3*frac(k2,i3)/2) - (frac(i2,i3)/2) - (3*frac(j2,i3)/2) + (frac(q2,i3)/2); 
    
    
% Componentes bin 
    b00 = p0/nchoosek(n2,0);
    b10 = p1/nchoosek(n2,1);
    b20 = p2/nchoosek(n2,2);
    b30 = p3/nchoosek(n2,3);

    b01 = b10 + b00; 
    b11 = b20 + b10; 
    b21 = b30 + b20; 

    b02 = b11 + b01; 
    b12 = b21 + b11; 

    b03 = b02 + b12; 
   
%     V = [b00 b01 b02 b03];
%     M(:,i3) = V'; 
    M1(e1,i3) = b00; 
    M1(e2,i3) = b01; 
    M1(e3,i3) = b02; 
    M1(e4,i3) = b03; 
    
  end 
  
%    plot3(M(:,1),M(:,2),M(:,3),'-ob')
   
end  

   M2(:,:,i+1) = M1;
   
end 
%%%%%----------%%%%%


%%%%%-----Matriz de los puntos de Bézier sin repeticiones-----%%%%%
% Primero ponemos los números repetidos iguales a cero
for i = 1:7  
    i1 = 1:19;
    i3 = 1:3;
    e1 = s4(i1);
    
    M2(e1,:,i) = 0;
    
end 

% Se sustituyen los ceros por filas nulas
[fila,columna] = find(M2==0);
M2(fila,:,:) = [];

% Plot de los puntos de Bézier sin repeticiones 
for i4 = 1:7 
    hold on 
    plot3(M2(:,1,i4),M2(:,2,i4),M2(:,3,i4),'-ob')
end
% La matriz M2(f,c,p), tiene como argumentos:
%       :f: fila de la matriz
%       :c: columna de la matriz
%       :p: pagina de la matriz
%%%%%----------%%%%%


%%%%%-----Curvas de Bézier-----%%%%%
%   Los polinomios de Bernstein estan dados por => Bni(t) = coef * (1-t)^(n-i) * t^i
%       :coef: coeficiente binomial => factorial(n)/(factorial(i) * fractorial(n-i))
%       :n: grado del polinomio 
%       :i: i = 0,1,....,n
% Para encontrar las curvas de Bézier, las cuales estan definidas en el
% intervalo [0,1] esta dadas por => P(t) = sumatoria(pi * Bni(t))
%       :pi: son los puntos de control, y hay n+1 puntos de control

m = length(M2(:,:,1));
n3 = m - 1; % Grado del polinomio de Bernstein 
t1 = 0:.01:1; % Intervalo t [0,1]
X = zeros(n3,1);
Y = zeros(n3,1);
Z = zeros(n3,1);
h = length(t1);


% Definición de las curvas de Bézier 
for p = 1:7
    
    for i = 1:m
        
      for j = 1:h 
          
    coef = factorial(n3)/(factorial(i-1) * factorial(n3-(i-1))); 
    B(i,j) = coef * (1-t1(j)).^(n3-(i-1)) .* t1(j).^(i-1); 
    
% Multiplicación entre los polinomios de Bernstein y los puntos de Bézier
    X(i,j) = B(i,j) .* M2(i,1,p);
    Y(i,j) = B(i,j) .* M2(i,2,p);
    Z(i,j) = B(i,j) .* M2(i,3,p);
         
      end 

    end
                    
    X1 = sum(X);
    Y1 = sum(Y);
    Z1 = sum(Z);
    
% % Plot de las curvas de Bézier 
%     hold on 
%     plot3(X1,Y1,Z1,'-r','LineWidth',1.5)
        
end 


% Diferencia entre el spline de Overhauser y la curva de Bézier 
for i = 1:101
    
    Difx(i) = abs(x(i) - X1(i));
    Dify(i) = abs(y(i) - Y1(i));
    Difz(i) = abs(z(i) - Z1(i)); 
   
end 
%%%%%----------%%%%%


%%%%%-----Parches de Bézier-----%%%%% 

% el producto tensorial de Bézier esta dado por: 
%     P(s,t) = sumatoria(i=0,n) sumatoria(j=0,m) Pij*Bmi(s)*Bnj(t)
%        :Pij: son los puntos de  control de los parches de Bézier
% Llamando Qi = sumatoria(i=0,m) Pij*Bmi(s) 
% Luego tenemos que el parche esta dado por: 
%       P(s,t) = sumatoria(j=0,n) Qj(s)*Bnj(t)

% Definicion de los polinomios de Bernstein 
t = linspace(0,1,60);
m = length(M2(1,1,:)); % Grado del polinomio transversal 
n = length(M2(1:4,1,1)); % Grado del polinomio periodico 



% for i = 0:m
%     Bt(i+1,:) = nchoosek(m,i)  * (1-t) .^ (m-i).* t .^ i;  
% end
% 
% figure
% hold on 
% for k = 1:m
%     plot(t,Bt(k,:))
% end 


