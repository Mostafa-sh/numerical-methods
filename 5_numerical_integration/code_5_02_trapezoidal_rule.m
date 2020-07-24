% Code 5-2 | Trapezoidal Rule
clc; clear
X = [1.6,         1.8,     2.1,     2.3,      2.7];
F = [3.12014, 4.42569, 6.04241, 8.03014, 10.46675];
%Method_________________________________________________________________
X = X(:).'; n = numel(F);
O = ones(1,n-1);
W = gallery('tridiag',O,[-1 zeros(1,n-2) 1], -1*O);
S = 0.5*X*W;
I = S*F(:);
%Illustration___________________________________________________________
fprintf('----------------\n');
fprintf('%s%12.5g\n','I = ',I); fprintf('----------------\n');
