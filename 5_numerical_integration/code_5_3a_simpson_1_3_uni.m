%% Code 5-3a | Simpson 1/3 Rule (uniform, odd grid)
clc; clear
X = linspace(0,2,5);    %uniform 2K+1, K>=1
F = sqrt(4-X.^2);
%Metod__________________________________________________________________
n = numel(X); h = (X(n)-X(1))/(n-1);  m = (n-1)/2;
S = 1/3*h*[1 repmat([4,2],[1,m-1]) 4 1];
I = S*F(:);
%Illustration___________________________________________________________
fprintf('----------------\n');
fprintf('%s%12.5g\n','I = ',I); fprintf('----------------\n');
