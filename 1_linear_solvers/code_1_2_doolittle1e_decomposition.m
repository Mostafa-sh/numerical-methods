%% Code 1-2 | Doolittle1e's Decomposition
clc; clear
A = [2 1 4 -2; -3 4 2 -1; 3 5 -2 1; -2 3 2 4];
B = [19; 1; 8 ; 13];
%Metod__________________________________________________________________
[n,m] = size(B);
Z = zeros(n,m);
L = eye(n);
U = A;
for j = 1:n-1, I = j+1:n;
    L(I,j) = U(I,j)/U(j,j);
    U(I,j) = 0;
    U(I,I) = U(I,I)-L(I,j)*U(j,I);
end
Y = Z;
for i = 1:n, J = 1:i;
    Y(i,:) = B(i,:)-L(i,J)*Y(J,:);
end
X = Z; % or = B;
for i = n:-1:1, J = i+1:n;
    X(i,:) = (Y(i,:)-U(i,J)*X(J,:))/U(i,i);
end
%Illustration___________________________________________________________
fprintf('L = \n');fprintf(['   [',repmat('%11.4g',[1,n]),' ]\n'],L.');
fprintf('U = \n');fprintf(['   [',repmat('%11.4g',[1,n]),' ]\n'],U.');
fprintf('X = \n');fprintf(['   [',repmat('%11.4g',[1,m]),' ]\n'],X.');
