clear all 
clc

%definicion de los puntos 

% %puntos equdistribuidos en un circulo de de radio 1 y centrado e [0 0] 
% theta = linspace(0,2*pi,10);
% x = cos(theta);
% y = sin(theta);
% s = size(theta);
% n = s(2);


% %el usuario introduce 5 puntos 
% [x,y] = ginput(5); 


% %el usuario introduce la cantidad de puntos que desee
%[x,y] = ginput;


% % variable z, crea cinco puntos aleatorios entre el 0 y el 1 
% z = rand(5,1);


% %poligono de control abierto 
% plot(x,y,'-og') 
% hold on 


% %poligono de control cerrado 
% Pc = [x' x(1); y' y(1)];
% plot(Pc(1,:),Pc(2,:),'-og') 


% %grafica en 3D poligono de control abierto 
% plot3(x,y,z,'-o')


% %grafica en 3D poligono de control cerrado 
% Mc = [x' x(1);y' y(1); z' z(1)];
% plot3(Mc(1,:),Mc(2,:),Mc(3,:),'-o')


% %puntos de fractura 
% load('sec8.mat')
% plot3(sec(:,1),sec(:,2),sec(:,3),'-o')
% 
% title('Proyecto 2')

t = 0:.01:1;


%definicion de limites
s = size(sec);
n = s(1);


%funciones de Overhauser 
f0= -(.5)*t + t.^2 -(.5)*t.^3;
f1= 1-(5/2)*t.^2 +(3/2)*t.^3;
f2= (.5)*t + 2*t.^2 - (3/2)*t.^3;
f3= -(.5)*t.^2 + (.5)*t.^3; 


% %%%spline 2D
% for i=1:1:n
%     k = i+1;
%     j =i+2; 
%     q = i+3; 
%     
%     
% % esto nos permite que el spline sea periodico   
%      if k > n
%           k = i-(n-1);
%      end 
%       if j > n
%           j = i-(n-2);
%       end 
%       
%       if q > n
%           q = i-(n-3);
%       end 
%       
%       
% % cuando no es un spline periodico 
% %        if q > n
% %          break 
% %        end 
%      
% 
%     x1= x(i)*f0 + x(k)*f1 + x(j)*f2 + x(q)*f3;
%     y1 = y(i)*f0 + y(k)*f1 + y(j)*f2 + y(q)*f3;
%     
%     
%     hold on 
%     grid on 
%     xlim([0 1]),ylim([0 1])
%     plot(x1,y1,'k')
%        
% end 


% %spline 3D
% for i=1:1:n
%     k = i+1;
%     j =i+2; 
%     q = i+3; 
%     
%     
% % esto nos permite que el spline sea periodico   
%      if k > n
%           k = i-(n-1);
%      end 
%       if j > n
%           j = i-(n-2);
%       end 
%       
%       if q > n
%           q = i-(n-3);
%       end 
%       
%       
% % cuando no es un spline periodico 
% %        if q > n
% %          break 
% %        end 
% 
%     x1= x(i)*f0 + x(k)*f1 + x(j)*f2 + x(q)*f3;
%     y1 = y(i)*f0 + y(k)*f1 + y(j)*f2 + y(q)*f3;
%     z1 = z(i)*f0 + z(k)*f1 + z(j)*f2 + z(q)*f3;
%     
%     hold on 
%     grid on 
%     plot3(x1,y1,z1,'k')
%             
% end


% %fractura 
% %spline 3D
% for i=1:1:n
%     k = i+1;
%     j =i+2; 
%     q = i+3; 
%     
%     
% % % esto nos permite que el spline sea periodico   
% %      if k > n
% %           k = i-(n-1);
% %      end 
% %       if j > n
% %           j = i-(n-2);
% %       end 
% %       
% %       if q > n
% %           q = i-(n-3);
% %       end 
%       
%       
% %cuando no es un spline periodico 
%        if q > n
%          break 
%        end 
% 
%     x1= sec(i,1)*f0 + sec(k,1)*f1 + sec(j,1)*f2 + sec(q,1)*f3;
%     y1= sec(i,2)*f0 + sec(k,2)*f1 + sec(j,2)*f2 + sec(q,2)*f3;
%     z1= sec(i,3)*f0 + sec(k,3)*f1 + sec(j,3)*f2 + sec(q,3)*f3;
%     
%     hold on 
%     grid on 
%     plot3(x1,y1,z1,'k')
%        
% end

