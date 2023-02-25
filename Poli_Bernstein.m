clear 
clc
t = 0:.01:1;
n = 4; %grado del polinomio 

for i =0:n
    c = nchoosek(n,i);
    f1 = (1-t).^(n-i);
    f2 = t.^i;
    B = c.*f1.*f2;
    
end