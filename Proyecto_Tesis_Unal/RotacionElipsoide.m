function [matriz1, matriz2, matriz3] = RotacionElipsoide(centro, LonEje1, LonEje2, LonEje3, matrizRotacion)
%RotacionElipsoide esta función es la encargada de rotar el elipsoide que mejor se aproxime a los puntos de Bezier. 
% Las entradas de esta función son un arreglo 1x3 el cual nos indique el centro del elipsoide, 
% tres numeros que nos digan cual es la longitud de los ejes del elipsoide y una matriz 3x3 la cual es la matriz de rotación. 
% La salida de la función son tres matrices que nos dan las coordenadas del elipsoide, que al utilizarlas como argumento en la función surf no despliega dicha figura.


[X,Y,Z] = ellipsoid(centro(1), centro(2), centro(3), LonEje1, LonEje2, LonEje3);

matrizElipsoide(:,1) = X(:);
matrizElipsoide(:,2) = Y(:);
matrizElipsoide(:,3) = Z(:);

max = length(matrizElipsoide);

    for i = 1:max
        matrizElipsoideRotada(i,:) = matrizElipsoide(i,:) * (- matrizRotacion);
    end

    for i = 0:20
        for j = 1:21
            matriz1(j,i+1) = matrizElipsoideRotada(j+(i*21),1);
            matriz2(j,i+1) = matrizElipsoideRotada(j+(i*21),2);    
            matriz3(j,i+1) = matrizElipsoideRotada(j+(i*21),3);
        end 
    end 

end