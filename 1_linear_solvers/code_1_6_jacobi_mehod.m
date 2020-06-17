%% Code 1-6 | Jacobi Method
clc; clear
A = [3 0 -1; 0 4 -2; -1 -2 5];
B = [4; 10; -10];
X = [0;0;0];                %in initial guess size(X) = size(B)
error = 1e-4;
itr = 100;
%Metod__________________________________________________________________
n = size(B,1);
d = diag(A);
A = eye(n)- bsxfun(@rdivide,A,d);
B = bsxfun(@rdivide,B,d);
Tab(1,:)= [0, X(:).', nan];                 %for illustration
for i = 1:itr
    X0 = X;
    X = B + A*X;
    er = norm(X0(:)./X(:)-1,inf);
    Tab(i+1,:) = [i, X(:).', er];           %for illustration
    if norm(X0(:)./X(:)-1,inf) <= error, break; end
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
