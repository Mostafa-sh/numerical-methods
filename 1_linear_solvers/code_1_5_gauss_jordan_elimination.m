%% Code 1-5 | Gauss-Jordan Elimination
clc; clear
A = [2 4 -4 0; 1 5 -5 -3; 2 3 1 3; 1 4 -2 2];
B = [12 6; 18 12; 8 -6; 8 4];
%Metod__________________________________________________________________
[n,m] = size(B);
for j = 1:n, I = j+1:n; J = [j,I];
    a = A(j,j);
    A(j,:) = A(j,:)/a;
    B(j,:) = B(j,:)/a;
    C = A(I,j);
    A(I,J) = A(I,J)-C*A(j,J);
    B(I,:) = B(I,:)-C*B(j,:);
end
for j = n:-1:2, I = j-1:-1:1;
    B(I,:) = B(I,:)-A(I,j)*B(j,:);
    A(I,j) = 0;
end
X = B;
%Illustration___________________________________________________________
fprintf('A = \n');fprintf(['   [',repmat('%11.4g',[1,n]),' ]\n'],A.');
fprintf('X = \n');fprintf(['   [',repmat('%11.4g',[1,m]),' ]\n'],X.');
