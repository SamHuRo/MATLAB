function MatrizPuntosControl = PuntosControl(MatrizDeDatos, numeroDePuntosEnCadaParche)
% PuntosControl esta función genera los puntos de control de la fractura mediante un cambio de base, 
% entre las curva de Overhauser y la base de Bernstein. 
% Hay dos entradas la primera es una matriz que contiene los puntos de la fractura, 
% y la segunda el numero de puntos que hay en cada anillo de la fractura. 
% La salida de la función es un arreglo multidimensional que tiene los puntos de control para crear posteriormente los parche de Bezier.

%Variables para la construcción de la matriz de puntos de control 
MatrizAlmacenarPuntos = [];
s1 = 1:4:80;
s2 = 2:4:80;
s3 = 3:4:80;
s4 = 4:4:80;
MatrizPuntosConvercionDeBase = [];   

% Construcción de los puntos de Bezier 
for i = 0:6
    % Puntos de control
    frac = MatrizDeDatos((i*numeroDePuntosEnCadaParche)+1:numeroDePuntosEnCadaParche*(i+1),1:3);
    
    %Definicion de variables
    s = size(frac);
    n1 = s(1);
    
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

            MatrizAlmacenarPuntos(e1,i3) = b00;
            MatrizAlmacenarPuntos(e2,i3) = b01;
            MatrizAlmacenarPuntos(e3,i3) = b02;
            MatrizAlmacenarPuntos(e4,i3) = b03;

        end


    end
    
    MatrizPuntosConvercionDeBase(:,:,i+1) = MatrizAlmacenarPuntos;
end

% Limpiar la matriz para que no se obtengan numeros repetidos 
for i = 1:7
    i1 = 1:19;
    e1 = s4(i1);

    MatrizPuntosConvercionDeBase(e1,:,i) = 0;

end
% Sustituir los ceros por filas nulas 

[fila,columna] = find(MatrizPuntosConvercionDeBase==0);
MatrizPuntosConvercionDeBase(fila,:,:) = [];

MatrizPuntosControl = MatrizPuntosConvercionDeBase;
end 