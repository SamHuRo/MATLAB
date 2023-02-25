clear 
clc

%% Definición del problema

params.alpha = 1.1;
params.beta = 0.4; 
params.gamma = 0.4; 
params.delta = 0.1; 


f = @(t, x) LotkaVolterraModel(x, params);

x0 = [20; 5];

%% Resolver la ecuación diferencial

t0 = 0;
tf = 100; 
dt = 0.01; 

[x, t] = RungeKutta4(f, x0, t0, tf, dt);

%% Graficasr los resultados 
figure;
subplot(1, 2, 1);
plot(t,x);
legend('Presa', 'Depredador');
xlabel('Tiempo (t)');
grid on;
ylabel('Población')

subplot(1, 2, 2);
plot(x(1,:), x(2,:));
xlabel('Presa');
ylabel('Depredadores');
grid on;
