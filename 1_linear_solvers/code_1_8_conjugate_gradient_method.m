%% Code 1-8 | Conjugate Gradient Method
%           | (for symmetric and positive definative systems)
clc; clear
A = [3 0 -1; 0 4 -2; -1 -2 5];
B = [4; 10; -10];
X = [0; 0; 0];
error = 1e-4;
itr = 20;
%Metod__________________________________________________________________
R = B-A*X; S = R;
Tab(1,:) = [i, X(:).', norm(R)];        %for illustration
for i = 1:itr
    AS = A*S;
    den = S.'*AS;
    alpha = S.'*R/den;
    X = X+alpha*S;
    R = B-A*X;
    err = norm(R);
    Tab(i+1,:) = [i, X(:).', err];      %for illustration
    if err <= error, break; end
    beta = -R.'*AS/den;
    S = R+beta*S;
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
