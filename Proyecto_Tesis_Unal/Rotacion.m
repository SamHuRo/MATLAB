function matrizRotada = Rotacion(matriz, matrizDeRotacion)
%Rotacion Esta función rota los puntos que se encuentran en un arreglo matricial, en donde cada una de las columnas representa una coordenada.
%  Entrada: el arreglo matricial y una matriz 3x3 la cual contiene la
%  rotación. 
%  Salida: un arreglo matricial que contiene los puntos rotados.


    for i = 1:length(matriz)

        matrizRotada(i,:) = matriz(i,:) * matrizDeRotacion;
    
    end 

end