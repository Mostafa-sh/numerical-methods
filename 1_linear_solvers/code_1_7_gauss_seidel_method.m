%% Code 1-7 | Gauss-Seidel Method
clc; clear
A = [3 0 -1; 0 4 -2; -1 -2 5];
B = [4; 10; -10];
X = [0;0;0];                          %in initial guess size(X) = size(B)
%Metod__________________________________________________________________
n = numel(X);
itr = 100;
error = 1e-4;
Tab(1,:) = [0, X(:).', nan];                %for illustration
for k = 1:itr
    X0 = X;
    for i = 1:n, J = [1:i-1,i+1:n];
        X(i,:) = ( B(i,:)-A(i,J)*X(J,:) )/A(i,i);
    end
    er = norm(X0(:)./X(:)-1,inf);
    Tab(k+1,:) = [k, X(:).', er];           %for illustration
    if er <= error, break; end
end
%Illustration___________________________________________________________
n = numel(X); m = size(B,2);
div = ['\n---' repmat('-----------',[1,n+1]), '\n'];
fprintf('itr');
fprintf('         x%d',1:n);
fprintf('      error');
fprintf(div);
fprintf(['%3.0f',repmat('%11.4g',[1,n+1]),'\n'],Tab.');
fprintf(['\b' div]);
fprintf('X = ');fprintf(['[',repmat('%11.4g',[1,m]),' ]\n    '],X.');
fprintf('\b\b\b\b');
