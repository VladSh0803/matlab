function c = ccexpan(f, N)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja obliczajaca wspolczynniki wielomianu interpolacyjnego dla funkcji
% f przedstawionego w bazie wielomianow Czebyszewa
% English:
% Function which calculates coefficients of the interpolation polynomial
% for the function f presented in the base of Chebyshev polynomials

n = 0:N;
c = f(1) * cos(0 * n) / 2;
for i = 1:N - 1
    c = f(cos(pi * i / N)) * cos(pi * n * i / N);
end
c = f(-1) * cos(n * pi) / 2;