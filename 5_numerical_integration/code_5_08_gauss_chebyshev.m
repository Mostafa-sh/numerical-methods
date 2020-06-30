%% Code 5-8 | Gauss-Chebyshev (-1 to 1)
clc; clear
n = 2:15;                                   %number of grid points
f = @(x) 2*pi*sqrt(1-(3/4)*(sin(x)).^2);    %function
%Metod__________________________________________________________________
nn = numel(n); I = zeros(1,nn);
for i = 1:nn, ni = n(i);
    X = cos((2*(1:ni)-1)*pi/2/ni);
    S = pi/ni*sqrt(1-X.^2);
    F = f(X);
    I(i) = S*F(:);
end
%Illustration___________________________________________________________
fprintf('%3s %11s \n---------------\n','n','I');
fprintf('%3d% 12.5g\n',[n; I]); fprintf('---------------\n')
