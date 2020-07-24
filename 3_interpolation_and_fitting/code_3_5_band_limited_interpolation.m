% Code 3-5 | Band limited interpolation (uniform initial points)
clc; clear; close all
x = sym('x');                   %for validation
f = x/2*sin(x) ;                %function for validation
X = linspace(-10,10,20);        %base points must be uniform
Xi = linspace(-10,10,100);      %interpolation points
F = eval(subs(f,X)).';          %function numerical data
%Method_________________________________________________________________
X = X(:); Xi = Xi(:); h = X(2)-X(1);
dX = bsxfun(@minus,Xi,X.');
P = sin(pi*dX/h)./(pi*dX/h);        %Sinc Function
P(isnan(P)) = 1;
Fi = P*F;
%Validation_____________________________________________________________
Fa = eval(subs(f,Xi));
e = norm(Fi-Fa,inf);                 %absolute error
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
xlabel('x'); ylabel('f(x)'); axis equal; axis tight
legend('show','location','NorthOutside');
