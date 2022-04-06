function [Q, err, K, T] = autoromberg(f, a, b, tol, ...
    m0, Kmin, Kmax)
% Author: Vladyslav Shestakov
% Polish:
% Funckja obliczajaca wartosc calki z funkcji f na przedziale [a, b] za
% pomoca metody Romberga
% English:
% Functions which calculates value of the integral of the function f on
% the interval [a, b] using the Romberg method

T = zeros(Kmax + 1);
T(1, 1) = trap(f, a, b, m0);
for i = 2:(Kmax + 1)
    T(i, 1) = trap(f, a, b, 2 ^ (i - 1) * m0);
    for j = 2:i
        T(i, j) = (4 ^ (j - 1) * T(i, j - 1) - T(i - 1, j - 1)) / ...
            (4 ^ (j - 1) - 1);
    end
    K = i - 1;
    if (K < Kmin)
        continue;
    else
        err = abs(T(i, i) - T(i - 1, i - 1)) / max([1, abs(T(i, i))]);
        if (i > 2)
            err2 = abs(T(i - 1, i) - T(i - 1, i - 1)) / ...
                max([1, abs(T(i, i))]);
        end
        if (i > 2)
            if (K == Kmax || (err < tol && err2 < tol))
                Q = T(i, i);
                err = max([tol err]);
                break;
            end
        else
            if (K == Kmax || err < tol)
            Q = T(i, i);
            err = max([tol err]);
            break;
            end
        end
    end
end