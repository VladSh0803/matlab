function e = bwinterp(f, a, b, n, tw)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja znajdujaca metoda ilorazow roznicowych wielomian interpolacyjny
% Lagrange'a dla funkcji f w przedziale [a, b] i oblicza maksymalny blad
% bezwzgledny interpolacji. Jesli e jest pominiety, to funkcja rysuje
% wykres funkcji f, wielomianu interpolacyjnego i punkty interpolacji
% English:
% Function which finds Lagrange interpolation polynomial using method of
% difference quotients for the function f in the interval [a, b] and
% calculates the maximum absolute error of the interpolation. If e is
% omitted, the function plots the graph of the function f, the 
% interpolation polynomial and the interpolation points

num = 1999;
ab = a + (0:num - 1) .* (b - a) ./ (num - 1);
if (nargin < 5)
    tw = 0;
end
if (tw == 0)
    x = a + (0:n - 1) .* (b - a) ./ (n - 1);
else
    if (tw == 1)
        x = (a + b) ./ 2 - ...
            cos(pi .* (2 .* (0:(n - 1)) + 1) ./ (2 .* n)) .* (b - a) ./ 2;
    else
        x = (a + b) ./ 2 - (b - a) .* cos(pi .* (0:(n - 1)) ./ (n-1)) ./ 2;
    end
end
y = f(x);
yab = f(ab);
wiel = wnwil(x, y);
if (nargout > 0)
    e = max(abs(yab - uhorn(ab, wiel, x)));
else
    fmax = max(yab);
    fmin = min(yab);
    fh = figure;
    ah = axes(fh);
    axis(ah, [a b (2 * fmin - fmax) (2 * fmax - fmin)]);
    set(ah, 'nextplot', 'add');
    phf = plot(ah, ab, yab);
    phi = plot(ah, ab, uhorn(ab, wiel, x));
    sw = scatter(ah, x, y);
    set(phf, 'linewidth', 2, 'color', '#00BFFF');
    set(phi, 'linewidth', 2, 'color', 'r');
    set(sw, 'linewidth', 3, 'markeredgecolor', 'g');
    set(fh, 'numbertitle', 'off');
    set(fh, 'menubar', 'none', 'toolbar', 'none', 'name', 'Zadanie nr 6c');
end