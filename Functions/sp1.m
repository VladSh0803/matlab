function w = sp1(A)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja, ktora sprawdza, czy jest macierz kwadratowa A postaci
% [1 1 1 1 ...; 2 3 4 5 ...; 3 5 7 9 ...; ...]
% English:
% Function which checks whether square matrix A is like
% [1 1 1 1 ...; 2 3 4 5 ...; 3 5 7 9 ...; ...]

w = true;
s = size(A(:, 1));
s = s(1);
a = (1:s)';
a1 = a - 1;
for i = 1:s
    if (any(a ~= A(:, i)))
        w = false;
        break;
    end
    a = a + a1;
end