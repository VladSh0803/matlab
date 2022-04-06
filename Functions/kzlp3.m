function Q = kzlp3(f, a, b, M)
% Author: Vladyslav Shestakov
% Polish:
% Funkcja przyblizajaca calke funkcji f na przedziale [a, b] za pomoca
% zlozonej kwadratury Gaussa z podzialem na M podprzedzialow
% English:
% Function which approximates integral of a function f on interval
% [a, b] using Gaussian quadrature with M subintervals

x = [
    -9.73906528517171720e-01
    -8.65063366688984511e-01
    -6.79409568299024406e-01
    -4.33395394129247191e-01
    -1.48874338981631211e-01
    1.48874338981631211e-01
    4.33395394129247191e-01
    6.79409568299024406e-01
    8.65063366688984511e-01
    9.73906528517171720e-01
    ];
wsp = [
    6.66713443086881376e-02
    1.49451349150580593e-01
    2.19086362515982044e-01
    2.69266719309996355e-01
    2.95524224714752870e-01
    2.95524224714752870e-01
    2.69266719309996355e-01
    2.19086362515982044e-01
    1.49451349150580593e-01
    6.66713443086881376e-02
    ];
h = (b - a) / M;
Q = repmat((1:M)', 1, length(x));
% Q = (Q - 1 / 2) .* h + a + x' .* (h / 2);
% Q = sum(sum(wsp' .* f(Q)));
% Q = Q * h / 2;
Q = sum(sum(wsp' .* f((Q - 1 / 2) .* h + a + x' .* (h / 2)))) * h / 2;