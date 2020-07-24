% Code 1-4 | Modified Choleski's Decomposition (for symmetric systems)
clc; clear
A = [-2 1 1; 1 2 1; 1 1 -2];                % must be symmetric
B = [0; 1; -4];
%Method_________________________________________________________________
[n,m] = size(B);
Z = zeros(n,m);
L = eye(n);
D = A;
for j = 1:n-1, I = j+1:n;
    L(I,j) = D(I,j)/D(j,j);
    for k = I, I1 = k:n;                     % Just lower triangle
        D(I1,k) = D(I1,k)-L(I1,j)*D(k,j);    % D(k,j) = L(j,k)'*D(j,j);
    end
end
D = diag(D);
DL = bsxfun(@times,D,L.');
Y = Z;
for i = 1:n, J = 1:i;
    Y(i,:) = B(i,:)-L(i,J)*Y(J,:);
end
X = Z;
for i = n:-1:1, J = i+1:n;
    X(i,:) = (Y(i,:) - DL(i,J)*X(J,:))/DL(i,i);
end
%Illustration___________________________________________________________
fprintf('L = \n');fprintf(['   [',repmat('%11.4g',[1,n]),' ]\n'],L.');
fprintf('D = \n');fprintf(['   [',repmat('%11.4g',[1,n]),' ]\n'],D.');
fprintf('X = \n');fprintf(['   [',repmat('%11.4g',[1,m]),' ]\n'],X.');
