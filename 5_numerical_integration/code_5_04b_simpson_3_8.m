% Code 5-4b | Simpson 3/8 Rule (non-uniform; 3K+1 grid)
clc; clear
x = sym('x');                           %for validation
f = sqrt(4-x^2);                        %function for validation
X = [0, 0.25, 0.75, 1, 1.25, 1.75, 2];  %non-uniform 3K+1, k>=1
F = eval(subs(f,X));
%Method_________________________________________________________________
n = numel(X); k = 4; m = (n-1)/3;
O = ones(1,k);
id = (1:k)'*ones(1,m)+O'*(0:(k-1):(k-1)*(m-1));
X = X(id); if isvector(X), X = X(:); end
C = 1./prod( reshape( ...
    [1 -1 0 0 ; 1  0 -1 0; 1 0  0 -1
    -1  1 0 0 ; 0  1 -1 0; 0 1  0 -1
    -1  0 1 0 ; 0 -1  1 0; 0 0  1 -1
    -1  0 0 1 ; 0 -1  0 1; 0 0 -1  1]*X, 3, k*m) );
B0 = ones(1,k*m);
B1 = [0 1 1 1 ; 1 0 1 1; 1 1 0 1; 1 1 1 0]*X; B1 = B1(:).';
B2 = prod( reshape(...
    [0 1 0 0; 0 0 1 0;
    +1 0 0 0; 0 0 1 0;
    +1 0 0 0; 0 1 0 0;
    +1 0 0 0; 0 1 0 0; ]*X, 2, k*m ) );
B3 = prod( reshape(...
    [0 1 0 0; 0 0 0 1;
    +1 0 0 0; 0 0 0 1;
    +1 0 0 0; 0 0 0 1;
    +1 0 0 0; 0 0 1 0; ]*X, 2, k*m ) );
B4 = prod( reshape(...
    [0 0 1 0; 0 0 0 1;
    +0 0 1 0; 0 0 0 1;
    +0 1 0 0; 0 0 0 1;
    +0 1 0 0; 0 0 1 0; ]*X, 2, k*m ) );
B5 = prod( reshape(...
    [0 1 0 0; 0 0 1 0; 0 0 0 1
    +1 0 0 0; 0 0 1 0; 0 0 0 1
    +1 0 0 0; 0 1 0 0; 0 0 0 1
    +1 0 0 0; 0 1 0 0; 0 0 1 0]*X, 3, k*m ) );
d = [-1 0 0 1];
D = [ d*X.^4/4 ; -d*X.^3/3 ; d*X.^2/2 ; -d*X]; D = kron(D,O);
S = C.*sum(D.*[B0; B1; B2+B3+B4; B5]);
S = full(sparse(1,id(:),S));
I = S*F(:);
%Illustration___________________________________________________________
fprintf('------------------------------\n');
fprintf('%16s %12.6g\n','Numerical I = ',I);
%Validation_____________________________________________________________
Ia = int(f,min(X(:)),max(X(:)));  %analytical integration (if applicable)
Ia = eval(Ia);
fprintf('%16s %12.6g\n','Analitical I = ',Ia);
fprintf('------------------------------\n');
