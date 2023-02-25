function [MatrizEjesElipsoide,LongitudesEjesElipsoide] = EjeYLonElipsoide(MatrizParcheBezierX, MatrizParcheBezierY, MatrizParcheBezierZ)
%RotacionElipsoide esta función encuentra la dirección y longitud del elipsoide que mejor se ajusta a los puntos que componen al parche de Bezier. 
% La entrada de la función son tres matrices, las cuales contienen las coordenadas X, Y y Z de los puntos del parche de Bezier. 
% La salida de esta es una matriz 3x3 con la dirección de los ejes y un arreglo 1x3 que cada uno de sus componentes contiene las longitudes de cada uno de los ejes.

    vectorParcheX = MatrizParcheBezierX(:);
    vectorParcheY = MatrizParcheBezierY(:);
    vectorParcheZ = MatrizParcheBezierZ(:);
    
[PCA, score, latent, tsquared, explained, mu] = pca([vectorParcheX, vectorParcheY, vectorParcheZ]);
    
 % Encontrar el vector ortonormal 
    vectorElipsoide1 = [PCA(1,1), PCA(2,1), PCA(3,1)];
    vectorElipsoide2 = [PCA(1,2), PCA(2,2), PCA(3,2)];
    vectorElipsoide3 = cross(vectorElipsoide1, vectorElipsoide2);
    
    MatrizEjesElipsoide = [transpose(vectorElipsoide1) transpose(vectorElipsoide2) transpose(vectorElipsoide3)];
    
 % Longitudes de los vectores
    
    % Dimencion de los ejes del elipsoide
    LonEje1 = mu(1);
    LonEje2 = mu(2);
    LonEje3 = mu(3);
    
    LongitudesEjesElipsoide = [LonEje1 LonEje2 LonEje3];

end