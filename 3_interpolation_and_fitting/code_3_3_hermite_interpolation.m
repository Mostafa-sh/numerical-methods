% Code 3-3 | Hermite Interpolation
%          | (chebyshev grid recommanded)+[ using chebspace.m ]
clc; clear; close all
x = sym('x');                           %for validation
f = exp(x/2)*cos(2*x)*x;                %function for validation
fx = diff(f,x);                         %first derivative for validation 
X = chebspace(-3,1,8);                  %initial points  
Xi = chebspace(X(1),X(end),40);         %interpolation points
F = eval(subs(f,X)).';                  %function numerical data
dF = eval(subs(fx,X)).';                %function numerical data
%Method_________________________________________________________________
X = X(:); Xi = Xi(:);
n = numel(X); m = numel(Xi);
dX  = bsxfun(@minus,X ,X.')+eye(numel(X));
dXi = bsxfun(@minus,Xi,X.');
Pai  = prod(dX ,2);
Paii = prod(dXi,2);
L  = bsxfun(@rdivide,Paii,Pai.')./dXi; L(dXi == 0)= 1;
dL = bsxfun(@rdivide,Pai ,Pai.')./dX;
dL = 1-sum(dL,2);
L2 = L.*L;
H =(ones(m,n)-2*bsxfun(@times,dXi,dL.')).*L2;
dH = dXi.*L2;
P = [H,dH];
Fi = P*[F;dF];
%Validation_____________________________________________________________
Fa = eval(subs(f,Xi));
e = norm(Fi-Fa,inf);                    %absolute error
%Illustration___________________________________________________________
plot(Xi,Fa,'linestyle','-','Color',[0.8,0.8,0.8],...
    'Marker','o','MarkerFaceColor',[0.8,0.8,0.8],...
    'displayname','Exact function'); hold on
plot(X,F,'linestyle','none','Color',[1 0.4 0.4],...
    'Marker','s','MarkerFaceColor',[1 0.4 0.4],...
    'displayname','Initial points');
plot(Xi,Fi,'linestyle','-','Color','k',...
    'Marker','.','MarkerFaceColor','k',...
    'displayname',['Interpolated points, error = ' num2str(e)]);
xlabel('x'); ylabel('f(x)');  axis tight
legend('show','location','NorthOutside');
