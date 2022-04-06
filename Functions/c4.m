function Y = c4(X)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja, ktora obllicza wartosc funkcji (sin(x)-x)*x^(-3) dla kazdego
% elementu macierzy X
% English:
% A function that computes the value of the function (sin(x)-x)*x^(- 3)
% for each element of the matrix X

Y = (sin(X) - X)./X.^3;
X_l = X < 0.35 & X > -0.35;
X_v = X(X_l);
Y(X_l) = X_v.^10/6227020800 - X_v.^8/39916800 +...
   X_v.^6/362880 - X_v.^4/5040 + X_v.^2/120 - 1/6;