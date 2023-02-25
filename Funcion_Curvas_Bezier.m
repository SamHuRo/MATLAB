clear
clc

[x,y] = ginput; 
plot(x,y,'-or')
grid on 

n = length(x); 
step = .001; 
k = 1;

vx = zeros(1,1/step);
vy = zeros(1,1/step); 


bx = @(n,i,t) nchoosek(n,i).*(t^i).*((1-t)^(n-i));
by = @(n,i,t) nchoosek(n,i).*(t^i).*((1-t)^(n-i));


for t = 0:step:1
    
sx = 0.0; 
sy = 0.0; 

    for i = 1:n
        
        sx = sx + bx(n,i,t) * x(i);
        sy = sy + by(n,i,t) * y(i);
    
    end 
    
    sx = sx + x(1) * (1-t)^n;
    sy = sy + y(1) * (1-t)^n;

    vx(k) = sx;
    vy(k) = sy; 
    k = k + 1;
    
end 

hold on 
plot(vx,vy,'b-')


