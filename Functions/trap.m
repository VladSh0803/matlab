function i = trap(f, a, b, n)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja obliczajaca wartosc calki z funkcji f na przedziale [a, b] za
% pomoca zlozonej kwadratury trapezow, n - liczba podprzedzialow
% English:
% Function which calculates integral value of the function f on the
% interval [a, b] using composite trapezoidal rule, n - number of
% sub-intervals

h = (b - a) / n;
x = [a + h:h:b - h];
fx = f(x);
i = h * (sum(fx) + 0.5 * (f(a)+f(b)));