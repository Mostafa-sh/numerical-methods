% Code 2-11 | Graeffe's Root Squaring Method: Polynomial Root-Finding         
%           | (works well if all roots are real)
%           | todo: redundant calculations, can be improved
clc; clear
A = [1,2,-15,2];  % p(x)=A(1)*x^(n-1)+A(2)*x^(n-2)+...+A(n-1)*x+A(n)
itr = 100;        % maximum itration
error = 1e-9;
%Method_________________________________________________________________
As = A;
A = fliplr(A);  
n = numel(A);
K = (-1).^(0:n-1);
for i = 1:itr
    A = conv(A,K.*A); A(2:2:end)=[];
    X = abs(A(1:end-1)./A(2:end)).^(1/(2^i));
    Px  = abs(polyval(As, X));
    Pmx = abs(polyval(As,-X));
    S = sign(Pmx-Px);               % p(x) vs p(-x)
    S(S==0) = (-1).^(1:sum(S==0));  % for p(x)==p(-x)
    Px(S==-1) = Pmx(S==-1);
    X = S.*X;
    Tab(i,:) = [i, X , Px];         % for illustration
    if max(Px)< error || any(isnan(X)), break; end
end
%Illustration___________________________________________________________
n = numel(X);
div = ['\n---' repmat('------------',[1,2*n]), '\n'];
fprintf('itr');
fprintf('          x%d',1:n);fprintf('       p(x%d)',1:n);
fprintf(div);
fprintf(['%3.0f',repmat('%12.5g',[1,2*n]),'\n'],Tab');
fprintf(['\b' div]);
