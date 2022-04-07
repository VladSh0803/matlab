function points_res = trdiv(D, n)
% Vladyslav Shestakov

a = zeros(2, n + 1);
b = zeros(2, n + 1);
a(1, :) = linspace(D(1, 1), D(1, 2), n + 1);
a(2, :) = linspace(D(2, 1), D(2, 2), n + 1);
b(1, :) = linspace(D(1, 2), D(1, 3), n + 1);
b(2, :) = linspace(D(2, 2), D(2, 3), n + 1);

points = zeros(2, (n + 1) * (n + 2) / 2);
p = a;
points(:, 1:n + 1) = a;
t = 0;
for i = n:-1:1
    p = [ 
        p(1, 2:end) + (b(1, end) - b(1, 1)) / n; 
        p(2, 2:end) + (b(2, end) - b(2, 1)) / n
        ];
    t = t + i + 1;
    points(:, t + 1:t + i) = p;
end

points_res = zeros(2, 3 * n^2);
t_p = 1;
t_pr = 1;
for i = n:-1:1
    points_res(:, t_pr:3:t_pr + (2 * i - 1) * 3 - 1) = ...
        points(:, [t_p:t_p + i - 1 t_p + i + 2:t_p + i + 2 + i - 2]);
    points_res(:, t_pr + 1:3:t_pr + (2 * i - 1) * 3 - 1) = ...
        points(:, t_p + 1:t_p + i + i - 1);
    points_res(:, t_pr + 2:3:t_pr + (2 * i - 1) * 3 - 1) = ...
        points(:, [t_p + i + 1:t_p + i + i t_p + 1:t_p + i - 1]);
    t_p = t_p + i + 1;
    t_pr = t_pr + (2 * i - 1) * 3;
end