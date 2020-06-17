%% Code 3-1 | Lagrange Interpolation
%           | (chebyshev grid recommanded) +[ using chebspace.m ]
clc; clear; close all
x = sym('x');                           %for validation
f = exp(x/2)*cos(2*x)*x;                %function for validation
X = chebspace(-3,1,8);                  %initial points  
Xi = chebspace(X(1),X(end),40);         %interpolation points
F = eval(subs(f,X)).';                  %function numerical data
%Metod_________________________________________________________________
X = X(:); Xi = Xi(:);
dX  = bsxfun(@minus,X ,X.')+eye(numel(X));
dXi = bsxfun(@minus,Xi,X.');
L = bsxfun(@rdivide,prod(dXi,2),prod(dX,2).')./dXi;
L(dXi == 0)= 1;                         %correcting
Fi = L*F;
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
