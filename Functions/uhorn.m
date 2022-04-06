function y = uhorn(t, c, x)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja obliczajaca za pomoca uogolnionego schematu Hornera wartosc
% wielomianu podanego w postaci Newtona
% English:
% Function which computes value of Newton polynomial using Horner's
% method

s = size(x);
y = t .* 0;
if (s(1) > 1)
    for i = s(1):-1:1
        y = c(i) + (t - x(i)) .* y;
    end
else
    for i = s(2):-1:1
        y = c(i) + (t - x(i)) .* y;
    end
end