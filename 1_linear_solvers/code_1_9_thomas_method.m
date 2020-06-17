%% Code 1-9 | Thomas Method (Tridiagonal Matrix Algorithm)
clc; clear
U = [2 2 2 -2];
D = [6 7 8 7 5];
L = [-1 -2 3 3];
B = [2 -3 4 -3 1]';
%Metod__________________________________________________________________
[n,m] = size(B);  X = zeros(n,m);
U(1)   = U(1)/D(1);
B(1,:) = B(1,:)/D(1);
for i = 2:n-1
    d = D(i)-U(i-1)*L(i-1);
    U(i)   = U(i)/d;
    B(i,:) = (B(i,:)-B(i-1,:)*L(i-1))/d;
end
B(n,:) = (B(n,:)-B(n-1,:)*L(n-1))/(D(n)-U(n-1)*L(n-1));
X(n,:) = B(n,:);
for i = n-1:-1:1
    X(i,:) = B(i,:)-U(i)*X(i+1,:);
end
%Illustration___________________________________________________________
fprintf('X = \n');fprintf(['   [',repmat('%11.4g',[1,m]),' ]\n'],X.');