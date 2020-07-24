% Code 3-4b | Standard Spline
clc; clear; close all
k = 2;                                 %order of Spline 1,2,3
X = [-0.2, -0.1, 0.2, 0.7, 1.5];       %data points
F = [5.2, 3, 0.6, 0.4, 0.2].';         %data points
Xi = linspace(X(1),X(end),30);         %interpolation points
%Method_________________________________________________________________
k1 = k+1;
n = numel(X);
O1 = ones(1,2*k1);
O2 = ones(k1,1);
B = zeros((n-2)*2*k1*k1, 1); I = B; J = I;
for i = 1:n-2
    Is = ((i-1)*k1+1:i*k1)';
    Is = Is(:,O1);
    Js = (i-1)*k1+1:(i+1)*k1;
    Js = Js(O2,:);
    x = X(i+1);
    if k == 1
        Bt = [0,0; 1,x];
        Bh = [1,x; -1,-x];
    elseif k == 2
        Bt = [0,0,0; 1,x,x^2; 0,1,2*x];
        Bh = [1,x,x^2; -1,-x,-x^2; 0,-1,-2*x];
    elseif k == 3
        Bt = [0,0,0,0; 1,x,x^2,x^3; 0,1,2*x,3*x^2; 0,0,2,6*x];
        Bh = [1,x,x^2,x^3; -1,-x,-x^2,-x^3; 0,-1,-2*x,-3*x^2; 0,0,-2,-6*x];
    end
    Bs = [Bt,Bh];
    S = (i-1)*2*k1*k1+1:i*2*k1*k1;
    B(S) = Bs(:);
    J(S) = Js(:);
    I(S) = Is(:);
end
x1 = X(1);
xn = X(n);
if k == 1
    B1 = [1,x1];
    Bn = [1,xn];
elseif k == 2
    B1 = [1,x1,x1^2; 0,1,2*x1];
    Bn = [1,xn,xn^2];
elseif k == 3
    B1 = [1,x1,x1^2,x1^3; 0,0,2,6*x1];
    Bn = [1,xn,xn^2,xn^3; 0,0,2,6*xn];
end
l = k1*(n-1);
f = size(B1,1);
e = size(Bn,1);
I = [repmat((1:f)',k1,1); I+f; repmat((l-e+1:l)',k1,1)];
J = [kron((1:k1)',ones(f,1)); J; kron((l-k1+1:l)',ones(e,1))];
B = [B1(:); B; Bn(:)];
B = sparse(I,J,B,l,l);
J = 2:n;
I = k1*(J-2)+f+1;
U = sparse([1,I],[1,J],1,k1*(n-1),n);
Xi = Xi(:);
m = numel(Xi);
O = ones(1,k1);
R = 0:k;
I = zeros(k1*m,1); J = I; Bi = J;
m = 0;
for i = 1:n-1
    if i ~= n-1, id = (X(i)<= Xi & Xi < X(i+1));
    else,        id = (X(i)<= Xi & Xi <= X(i+1));
    end
    if any(id~=0)
        Xs = Xi(id);
        ms = numel(Xs);
        Is = (m+1:m+ms)';
        Is = Is(:,O);
        Js = (i-1)*k1+1:i*k1;
        Js = Js(ones(ms,1),:);
        Bs = bsxfun(@power,Xi(id),R);
        S = k1*m+1:k1*m+k1*ms;
        I(S)  = Is(:);
        J(S)  = Js(:);
        Bi(S) = Bs(:);
        m = m+ms;
    end
end
Bi = sparse(I,J,Bi,m,l);
P = Bi*(B\U);
Fi = P*F;
%Illustration___________________________________________________________
plot(X,F,'linestyle','none','Color',[1 0.4 0.4],...
    'Marker','s','MarkerFaceColor',[1 0.4 0.4],...
    'displayname','Initial points'); hold on
plot(Xi,Fi,'linestyle',':','Color','k',...
    'Marker','o','MarkerFaceColor','k',...
    'displayname','Interpolated points');
xlabel('x'); ylabel('f(x)'); axis tight
legend('show','location','best');
