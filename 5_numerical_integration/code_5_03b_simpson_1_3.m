%% Code 5-3a | Simpson 1/3 Rule (non-uniform, odd grid)
clc; clear
x = sym('x');                       %for validation
f = sqrt(4-x^2);                    %function for validation
X = [0 0.75 1.25 1.75 2];           %non-uniform 2K+1, K>=1
F = eval(subs(f,X));
%Metod__________________________________________________________________
n = numel(X); k = 3; m = (n-1)/2;
O = ones(1,k);
id = (1:k)'*ones(1,m)+O'*(0:(k-1):(k-1)*(m-1));
X = X(id); if isvector(X), X = X(:); end
C = 1./prod( reshape(...
    [1 -1 0; 1  0 -1;
    -1  1 0; 0  1 -1;
    -1  0 1; 0 -1  1]*X, 2, k*m) );
B0 = ones(1,k*m);
B1 = [0 1 1; 1 0 1; 1 1 0]*X; B1 = B1(:).';
B2 = prod( reshape(...
    [0 1 0; 0 0 1;
    +1 0 0; 0 0 1;
    +1 0 0; 0 1 0]*X, 2, k*m) );
d = [-1 0 1];
D = [(d*X.^3)/3; -(d*X.^2)/2; d*X]; D = kron(D,O);
S = C.*sum(D.*[B0;B1;B2]);
S = full(sparse(1,id(:),S));
I = S*F(:);
%Illustration___________________________________________________________
fprintf('------------------------------\n');
fprintf('%16s %12.6g\n','Numerical I = ',I);
%Validation_____________________________________________________________
Ia = int(f,min(X(:)),max(X(:)));   %analytical integration (if applicable)
Ia = eval(Ia);
fprintf('%16s %12.6g\n','Analitical I = ',Ia);
fprintf('------------------------------\n');
