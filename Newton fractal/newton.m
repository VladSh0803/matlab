function newton(coefs, domain, eps, m, nIteration, cmap)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja, która tworzy wykres, wizualizujący metodę Newtona znajdowania
% miejsc zerowych funkcji wielomianowej. Każdy punkt płaszczyzny ma kolor w
% zależności od liczby wykonanych iteracji
% 
% coefs - wektor współczynników wielomianu, zaczynając od wyrazu wolnego
% domain - współrzędne obszaru, na którym szukamy pierwiastków w postaci
% [x1 y1 x2 y2], gdzie x1 i y1 - współrzędne dolnego lewego rogu, x2 i y2 -
% -||- górnego prawego rogu
% eps - dokładność obliczeń
% m - liczba podziałów obszaru
% nIteration - maksymalna liczba iteracji
% cmap - zestaw kolorów w postaci macierzy RGB o rozmiarze M*3
% (dla lepszej rozróżnialności M >= nIteration)
%
% Domyślne wartości - 
% coefs: [-1 0 0 1] = x^3 - 1
% domain: [-2 -2 2 2]
% eps: 1e-13
% m: 500
% nIteration: 50
% cmap: getcolormap(nIteration, 2)
%
% English:
% Function which creates a graph that visualizes Newton's method of finding
% zeros of a polynomial function. Each point on the plane has a color
% depending on the number of iterations made
%
% coefs - vector of coefficients of a polynomial, starting with y-intercept
% domain - coordinates of the area where we are looking for roots
% in the form [x1 y1 x2 y2], where x1 and y1 - lower left corner coordinates,
% x2 i y2 - upper right corner coordinates
% eps - accuracy of calculations
% m - number of subareas (incorrect translation?)
% nIteration - maximum number of iterations
% cmap - a set of colors in the form of an RGB matrix with size M * 3
% (for better distinguishability M >= nIteration)
%
% Default values - 
% coefs: [-1 0 0 1] = x^3 - 1
% domain: [-2 -2 2 2]
% eps: 1e-13
% m: 500
% nIteration: 50
% cmap: getcolormap(nIteration, 2)

arguments
    coefs (1, :) double = [-1 0 0 1]
    domain (1, 4) double = [-2 -2 2 2]
    eps (1, 1) double {mustBePositive} = 1e-13
    m (1, 1) uint32 {mustBePositive} = 500
    nIteration (1, 1) uint8 {mustBePositive} = 50
    cmap (:, 3) double {mustBeNonnegative, ...
        mustBeLessThanOrEqual(cmap, 1)} = getcolormap(nIteration, 2)
end

x = linspace(domain(1), domain(3), m);
y = linspace(domain(4), domain(2), m);
[X, Y] = meshgrid(x, y);
C = zeros(m);
k = 0;
Zc = X + 1i .* Y;
Z = 0 .* X + 0i .* Y;
cond = abs(Z - Zc) > eps;
while (k < nIteration)
    [F, Fp] = horner(coefs, Zc(cond));
    Z(cond) = Zc(cond) - F ./ Fp;
    C(cond) = C(cond) + 1;
    k = k + 1;
    cond = abs(Z - Zc) > eps;
    if (~any(cond, 'all'))
        break;
    end
    Zc(cond) = Z(cond);
end
maxi = max(C, [], 'all');
mini = min(C, [], 'all');
f = figure('Name', 'Metoda Newtona', 'NumberTitle', 'off');
colormap(f, cmap);
[~, c] = contourf(X, Y, C, maxi - mini);
c.LineStyle = 'none';
colorbar