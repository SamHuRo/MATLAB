function [x, y, z] = ParchesBezier(puntosEnX, puntosEnY, puntosEnZ, gradoPolinomioU, gradoPolinomioV, centrar)
%ParcheBezier esta función crea los parches de Bezier. 
% Las entradas de la función son tras matrices las cuales contienen los puntos de control para construir dicho parche, 
% también se necesita especificar cual va a ser el grado de los polinomios de Bezier u y v y por ultimo se pide la entrada de un booleano, 
% ya sea true en el caso de que se quiera llevar el parche al origen, y false si no se quiere llevar al origen. 
% La salida de esta función son tres matrices que contiene las coordenadas X, Y y Z de los puntos que componen al parche. 

% Vector en la dirección u 
u = linspace(0,1,30);

% Vector en la dirección v
v = linspace(0,1,30);

% Vectores en donde se van a guardar los puntos del parche 
% Componente x 
matrizParcheX = zeros(length(v),length(u));

% Componente y 
matrizParcheY = zeros(length(v),length(u));

% Componente z
matrizParcheZ = zeros(length(v),length(u));

% Construcción de los parche de Bezier 
    for k1 = 1:length(v)
            for k = 1:length(u)
                for i = 0:gradoPolinomioU
                    Polinomio_Bernstien_u(i+1,:) = nchoosek(gradoPolinomioU,i)*(1-u(k)).^(gradoPolinomioU- i).* u(k).^i;
                end 
                for i = 0:gradoPolinomioV 
                    Polinomio_Bernstien_v(i+1,:) = nchoosek(gradoPolinomioV,i)*(1-v(k1)).^(gradoPolinomioV - i).* v(k1).^i;
                end 
                
                transpuesto_polinomio_Bernstein_v = transpose(Polinomio_Bernstien_v);
                
                multiplicacion_x = puntosEnX * Polinomio_Bernstien_u;
                multiplicacion_y = puntosEnY * Polinomio_Bernstien_u;
                multiplicacion_z = puntosEnZ * Polinomio_Bernstien_u;
        
                premultiplicacion_x = multiplicacion_x(:,1);
                premultiplicacion_y = multiplicacion_y(:,1);
                premultiplicacion_z = multiplicacion_z(:,1);
        
                post_multiplicacion_x = transpuesto_polinomio_Bernstein_v(1,:) * premultiplicacion_x;
                post_multiplicacion_y = transpuesto_polinomio_Bernstein_v(1,:) * premultiplicacion_y;
                post_multiplicacion_z = transpuesto_polinomio_Bernstein_v(1,:) * premultiplicacion_z;
                
                matrizParcheX(k1,k) = post_multiplicacion_x;
                matrizParcheY(k1,k) = post_multiplicacion_y;
                matrizParcheZ(k1,k) = post_multiplicacion_z; 
        
            end
    
                
     % Se pintan los parches con la matriz color, la cual indica la cantida de roj, verde y azul que se va a utilizar           
                color(:,:,1) = zeros(30); % rojo 
                color(:,:,2) = ones(30).*linspace(0.5,0.6,30); % verde 
                color(:,:,3) = ones(30).*linspace(0,1,30); % azul 
    end
    if centrar == true 
        matrizParche(:,1) = matrizParcheX(:);
        matrizParche(:,2) = matrizParcheY(:);
        matrizParche(:,3) = matrizParcheZ(:);
    
        puntoMedio = mean(matrizParche);
    
        matrizParcheOrigenX =  matrizParcheX - puntoMedio(1);
        matrizParcheOrigenY =  matrizParcheY - puntoMedio(2);
        matrizParcheOrigenZ =  matrizParcheZ - puntoMedio(3);
    
        x = matrizParcheOrigenX;
        y = matrizParcheOrigenY;
        z = matrizParcheOrigenZ;
    
    else 
        x = matrizParcheX;
        y = matrizParcheY;
        z = matrizParcheZ;
    end 

end