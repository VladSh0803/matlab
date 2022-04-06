function wykfunpoch(f, a, b)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja, ktora rysuje wykres f, f' i f'' na przedziale [a, b]
% English:
% Function that draws the plot of f, f' and f'' on the interval [a, b] 

h = 0.01;
x = a:h:b;
x1 = a+h:h:b-h;
y = f(x);
y1 = (f(x1 + h) - f(x1 - h)) / (2 * h);
y2 = (f(x1 + h) - 2 * f(x1) + f(x1 - h)) / (h * h);
fh = figure;
ah = axes(fh);
set(ah, 'nextplot', 'add');
ph1 = plot(ah, x, y);
ph2 = plot(ah, x1, y1, ':');
ph3 = plot(ah, x1, y2, '--');
th = title(['Wykres funkcji ' func2str(f)]);
lh = legend();
set(ph1, 'color', '#5DE100', 'linewidth', 2, 'displayname', 'funkcja');
set(ph2, 'color', '#FF8C00', 'linewidth', 2, 'displayname', '1. poch.');
set(ph3, 'color', '#00BFFF', 'linewidth', 2, 'displayname', '2. poch.');
set(fh, 'menubar', 'none', 'toolbar', 'none', 'name', 'Zadanie nr 2');
set(fh, 'numbertitle', 'off', 'units', 'normalized');
set(fh, 'outerposition', [0.05 0.05 0.9 0.9])
set(th, 'fontsize', 16, 'units', 'normalized', 'position', [0.08 1.01]);
set(ah, 'position', [0.03 0.04 0.95 0.92]);
set(lh, 'orientation', 'horizontal', 'units', 'normalized');
lh_pos = get(lh, 'position');
lh_pos(1) = 0.99 - lh_pos(3);
lh_pos(2) = 0.99 - lh_pos(4);
set(lh, 'position', lh_pos);