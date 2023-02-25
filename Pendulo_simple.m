% variables 
m = 2.0; 
k = 2.0; 
c = 0.0; %critical damping = 2 * sqrt(m*k) = 4.0 

F0 = 1.0;
delta_t = 0.1;
omega = 1.0; 
time = 0.0:delta_t:20.0;

% inicial state 
y = [0,1]; %[velocity, displacement] 

A = [m,0;0,1];
B = [c,k;-1,0];
F = [0.0,0.0]

Y= [];
force = []; 


% time-stepping solution 
for t = time 
    F(0) = F0 * cos(omega*t);
    y = y + delt_t * inv(A).dot( F - B.dot(y) );
    Y = y(1);
    force = F(0);

end 
