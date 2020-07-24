% Code 5-8 | Gauss-Chebyshev ( int -1 to 1 of f(x)/sqrt(1-x^2) )
clc; clear
n = 2:8;                                   %number of grid points
f = @(x) 2*pi*sqrt(1-(3/4)*(sin(x)).^2);   %function
%Method_________________________________________________________________
nn = numel(n); I = zeros(1,nn);
for i = 1:nn, ni = n(i);
    X = cos((2*(1:ni)-1)/2/ni*pi);
    S = pi/ni*ones(1,ni);
    F = f(X);
    I(i) = S*F(:);
end
%Illustration___________________________________________________________
fprintf('%3s %11s \n---------------\n','n','I');
fprintf('%3d% 12.5g\n',[n; I]); fprintf('---------------\n')
