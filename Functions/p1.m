function A = p1(n)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja, ktora tworzy macierz kwadratowa A rozmiaru n*n postaci
% [1 1 1 1 ...; 2 3 4 5 ...; 3 5 7 9 ...; ...]
% English:
% Function which creates square matrix A of size n*n like
% [1 1 1 1 ...; 2 3 4 5 ...; 3 5 7 9 ...; ...]

A = zeros(n);
A(:, 1) = 1:n;
a = A(:, 1) - 1;
for i = 2:n
    A(:, i) = A(:, i - 1) + a;
end