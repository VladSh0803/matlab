function c = wnwil(x, y)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja obliczajaca metoda ilorazow roznicowych wspolczynniki postaci
% Newtona wielomianu interpolacyjnego Lagrange'a
% English:
% Function which calculates using method of difference quotients coefficients of the Newton form of the Lagrange interpolation polynomial

tmp = size(x);
s = max(tmp) - 1;
c = zeros(s);
if (tmp(1) > 1)
    c(:, 1) = (y(2:end) - y(1:end - 1)) ./ (x(2:end) - x(1:end - 1));
    for i = 2:s
        c(i:s, i) = (c(i:s, i - 1) - c(i - 1:s - 1, i - 1)) ./ ...
            (x(i + 1:end) - x(1:end - i));
    end
    c = [y(1); diag(c)];
else
    c(:, 1) = ((y(2:end) - y(1:end - 1)) ./ (x(2:end) - x(1:end - 1)))';
    for i = 2:s
        c(i:s, i) = (c(i:s, i - 1) - c(i - 1:s - 1, i - 1)) ./ ...
            (x(i + 1:end) - x(1:end - i))';
    end
    c = [y(1) diag(c)'];
end