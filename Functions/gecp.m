function x = gecp(A, b)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja rozwiazujaca metode eliminacji Gaussa z pelnym wyborem elementow
% glownych uklad rownan liniowych Ax=b 
% English:
% Function which solves system of linear equations Ax=b using Gauss
% elimination with complete pivoting

n = size(A, 1);
p = 1:n;
for i = 1:(n - 1)
    val = max(max(abs(A(i:n, i:n))));
    [r, k] = find(abs(A(i:n, i:n)) == val);
    r = r + i - 1;
    k = k + i - 1;
    A([i, r], :) = A([r, i], :);
    A(:, [i, k]) = A(:, [k, i]);
    p([i, k]) = p([k, i]);
    b([i, r]) = b([r, i]);
    if (A(i, i) ~= 0)
        d = (A(i + 1:n, i) / A(i, i));
        A(i + 1:n, :) = A(i + 1:n, :) - A(i, :) .* d;
        b(i + 1:n) = b(i + 1:n) - d * b(i);
    end
end
opt.UT = true;
x = linsolve(A, b, opt);
x(p) = x;