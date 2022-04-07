function [y, Y] = der_solve(x0, xn, n, h, d, c, y0, b, yp0, a, ypp0)
% Vladyslav Shestakov
%
% Funkcja implementująca metodę Adamsa-Bashfortha rzędu 4-go. Wartości
% początkowe obliczane są za pomocą metody Rungego-Kutty rzędu 4-go
% (implementacja w funkcji "rk")
%
% Funkcja rozwiązuje równania różniczkowe do 3-go rzędu włącznie postaci
% a(x)y''' + b(x)y'' + c(x)y' + d(x)y + h(x) = 0
%
% x0, xn - przedział, na którym rozwiązujemy równanie
% n - liczba podprzedziałów (dla n < 5 metoda Adamsa-Bashfortha nie jest
% stosowana, liczone są tylko)
% h, d, c, b, a - wskaźniki na odpowiednie fukcje (funkcja przy najwyższej
% pochodnej nie powinna się zerować na przedziale [x0; xn])
% y0, yp0, ypp0 - wartości w punkcie x0 odpowiednio funkcji, pochodnej i
% drugiej pochodnej
%
% Liczba argumentów, podanych przy wywołaniu, wyznacza rząd równania
% różniczkowego 
% Liczba argumentów - rząd równania
% 7 - 1
% 9 - 2
% 11 - 3
% Inne zestawy argumentów są niedozwolone

arguments
    x0 (1, 1) double
    xn (1, 1) double
    n (1, 1) {mustBePositive}
    h {mustBeA(h, "function_handle")}
    d {mustBeA(d, "function_handle")}
    c {mustBeA(c, "function_handle")}
    y0 (1, 1) double
    b {mustBeA(b, "function_handle")} = @()0
    yp0 (1, 1) double = 0
    a {mustBeA(a, "function_handle")} = @()0
    ypp0 (1, 1) double = 0
end

% Inicjalizacja i wyznaczanie rzędu równania
switch nargin
    case 7
        f = @(Y)(- h(Y(1)) - d(Y(1)) * Y(2)) / c(Y(1));
        Y = zeros(2, n + 1);
        Y(:, 1) = [x0 y0]';
    case 9
        f = @(Y)(-h(Y(1)) - d(Y(1)) * Y(2) - c(Y(1)) * Y(3)) / b(Y(1));
        Y = zeros(3, n + 1);
        Y(:, 1) = [x0 y0 yp0]';
    case 11
        f = @(Y)(-h(Y(1)) - d(Y(1)) * Y(2) - c(Y(1)) * Y(3)...
            - b(Y(1)) * Y(4)) / a(Y(1));
        Y = zeros(4, n + 1);
        Y(:, 1) = [x0 y0 yp0 ypp0]';
end
F = @(Y)[1; Y(3:end); f(Y)];
H = (xn - x0) / n;

% Metoda Rungego-Kutty
for i = 2:min([4 n + 1])
    Y(:, i) = rk(Y(:, i - 1), F, H);
end

% Metoda Adamsa-Bashfortha
if (n >= 4)
    for i = 5:n + 1
        Y(:, i) = Y(:, i - 1) + (H / 24) .* ...
            (55 .* F(Y(:, i - 1)) ...
            - 59 .* F(Y(:, i - 2)) ...
            + 37 .* F(Y(:, i - 3)) ...
            - 9 .* F(Y(:, i - 4)));
    end
end
y = Y(2, :);