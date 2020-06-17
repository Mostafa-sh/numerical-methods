%% Code 1-1 | Gauss Elimination
clc; clear
A = [2 1 4 -2; -3 4 2 -1; 3 5 -2 1; -2 3 2 4];
B = [19; 1; 8 ; 13];
%Metod__________________________________________________________________
[n,m] = size(B);
for j = 1:n-1, I = j+1:n; J = [j,I];
    C = A(I,j)/A(j,j);
    A(I,J) = A(I,J)-C*A(j,J);
    B(I,:) = B(I,:)-C*B(j,:);
end
X = zeros(n,m); % or = B;
for i = n:-1:1, J = i+1:n;
    X(i,:) = (B(i,:)-A(i,J)*X(J,:))/A(i,i);
end
%Illustration___________________________________________________________
fprintf('A = \n');fprintf(['   [',repmat('%11.4g',[1,n]),' ]\n'],A.');
fprintf('X = \n');fprintf(['   [',repmat('%11.4g',[1,m]),' ]\n'],X.');
