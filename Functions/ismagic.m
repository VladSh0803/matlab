function w = ismagic(A)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja, ktora sprawdza, czy podana macierz kwadratowa A jest macierza
% magiczna
% English:
% Function that checks whether the given square matrix A is a magic
% matrix

n = size(A, 1);
s1 = sum(A); % Suma elementow po kolumnach
s2 = sum(A, 2); % Suma elementow po wierszach
s3 = sum(diag(A)); % Suma elementow przekatnej
s4 = sum(A(n:n-1:n*n-1)); % Suma elementow przeciwprzekatnej
if (any(s1 - s2') || any([s1(1) - s3, s1(1) - s4]))
    w = false;
else
    w = true;
end