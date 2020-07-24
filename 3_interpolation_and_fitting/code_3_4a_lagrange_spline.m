% Code 3-4a | Lagrange Spline
clc; clear; close all
k = 3;                            %order of Spline 1,2,3
X = [-0.2, -0.1, 0.2, 0.7, 1.5];  %data points
F = [5.2, 3, 0.6, 0.4, 0.2].';    %data points
Xi = linspace(X(1),X(end),30);    %interpolation points
%Method_________________________________________________________________
n = numel(X);
if k == 1
    B = speye(n); U = B;             %for the unity of the code
elseif k == 2
    I = 2:n;                I = I([1;1],:);         I = [1;I(:)];
    J = bsxfun(@plus,[0;1],1:n-1);                  J = [1;J(:)];
    B = X(1:n-1)-X(2:n);    B = B([1;1],:);         B = [1;B(:)];
    U = [2;-2];             U = U(:,ones(1,n-1));   U = [0;U(:)];
    B = sparse(I,J,B,n,n);
    U = sparse(I,J,U,n,n);
elseif k == 3
    I = 2:n-1;              I = I([1;1;1],:);       I = [1;I(:);n];
    J = bsxfun(@plus,[0;1;2],1:n-2);                J = [1;J(:);n];
    B1 = X(1:n-2)-X(2:n-1);
    B3 = X(2:n-1)-X(3:n);
    B = [B1;2*(B1+B3);B3];                          B = [1;B(:);1];
    B = sparse(I,J,B,n,n);
    U1 = 1./B1;
    U3 = 1./B3;
    U = 6*[U1;-(U1+U3);U3];                         U = [0;U(:);0];
    U = sparse(I,J,U,n,n);
end
Xi = Xi(:);
m = numel(Xi);
I = zeros(2*m,1); J = I; Bi = J; Ui = Bi;  %preallocating
m = 0;
for i = 1:n-1
    if i ~= n-1, id = (X(i)<= Xi & Xi < X(i+1));
    else,        id = (X(i)<= Xi & Xi <= X(i+1));
    end
    if any(id~= 0) 
        Xs = Xi(id);
        ms = numel(Xs);
        Is = (m+1:m+ms)';
        Is = Is(:,[1 1]);
        Js = [i,i+1];
        Js = Js(ones(ms,1),:);
        if k == 1
            dx = X(i+1)-X(i);
            Bs = [X(i+1)-Xs,Xs-X(i)]/dx;
            Us = zeros(ms,2);               %for the unity of the code
        elseif k == 2
            dx = X(i+1)-X(i);
            Bs = 0.5*[-(X(i+1)-Xs).^2/dx+dx,(Xs-X(i)).^2/dx];
            Us = [ones(ms,1) zeros(ms,1)];
        elseif k == 3
            dx = X(i+1)-X(i);
            dX1 = X(i+1)-Xs; dX2 = Xs-X(i);
            Bs = [dX1.^3/dx-dX1*dx,dX2.^3/dx-dX2*dx]/6;
            Us = [dX1 dX2]/dx;
        end
        S = 2*m+1:2*m+2*ms;
        I(S)  = Is(:);
        J(S)  = Js(:);
        Bi(S) = Bs(:);
        Ui(S) = Us(:);
        m = m+ms;
    end
end
Bi = sparse(I,J,Bi,m,n);
Ui = sparse(I,J,Ui,m,n);
P = Bi*(B\U)+Ui;
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
