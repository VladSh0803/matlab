function w = isrcneg(A)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja, ktora sprawdza, czy ma macierz A w kazdym wierszu i w kazdej
% kolumnie przynajmniej jeden element ujemny
% English:
% Function that checks whether matrix A has in every row and column 
% at least one negative element

An = A < 0;
w = all(any(An)) && all(any(An, 2));