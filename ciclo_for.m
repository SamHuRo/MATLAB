clear
clc
for t = 0:1/8:1
   disp(t) 
    
end

%for i = inicio:incremento;final
%   instrucciones 
%end 

x = linspace(0,2*pi,100); 
for A= 1:10
    hold on 
    y = A*cos(x);
    plot(x,y);
end

