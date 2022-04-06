function [f, fp] = horner(coefs, x)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja licząca wartość wielomianu i jego pochodnej w punkcie x
% English:
% function which calculates value of the polynomial and its
% derivative at x

arguments
    coefs (1, :) double
    x (:, :) double
end

n = length(coefs);
f = coefs(n);
fp = f;
for i = n-1:-1:2
    f = coefs(i) + x .* f;
    fp = f + x .* fp;
end
f = coefs(1) + x .* f;