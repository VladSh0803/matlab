function res = din(f, n)
% Vladyslav Shestakov

D = [ -1 -1 0; 0 1 1 ];
D(:, :, 2) = [1 1 0; 0 1 1];
D(:, :, 3) = [-1 -1 0; 0 -1 -1];
D(:, :, 4) = [1 1 0; 0 -1 -1];
res = 0;
for i = 1:4
    Dtr = trdiv(D(:, :, i), n);
    t = Dtr(:, 1:3:end);
    P = zeros(1, size(Dtr, 2) / 3);
    for j = 1:size(Dtr, 2) / 3
        P(j) = abs(det([1 1 1; ...
            Dtr(:, (j - 1) * 3 + 1:(j - 1) * 3 + 3 )]) ./ 2);
    end
    Dtr(:, 1:3:end) = (Dtr(:, 1:3:end) + Dtr(:, 2:3:end)) ./ 2;
    Dtr(:, 2:3:end) = (Dtr(:, 2:3:end) + Dtr(:, 3:3:end)) ./ 2;
    Dtr(:, 3:3:end) = (Dtr(:, 3:3:end) + t) ./ 2;
    S = P .* (f(Dtr(1, 1:3:end), Dtr(2, 1:3:end)) + ...
        f(Dtr(1, 2:3:end), Dtr(2, 2:3:end)) + ...
        f(Dtr(1, 3:3:end), Dtr(2, 3:3:end))) ./ 3;
    res = res + sum(S);
end