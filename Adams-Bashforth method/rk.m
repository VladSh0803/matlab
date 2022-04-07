function Y = rk(Y0, F, h)
% Vladyslav Shestakov
% Funkcja implementująca metodę Rungego-Kutty rzędu 4-go

K0 = F(Y0);
K1 = F(Y0 + (h / 2) * K0);
K2 = F(Y0 + (h / 2) * K1);
K3 = F(Y0 + h * K2);
Y = Y0 + (h / 6) * (K0 + 2 * K1 + 2 * K2 + K3);