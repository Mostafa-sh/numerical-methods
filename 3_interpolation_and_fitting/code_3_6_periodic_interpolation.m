% Code 3-6 | Periodic Interpolation (only periodic data)
%          | +[ using periodspace.m ]
clc; clear
x = sym('x');                       %for validation
f = sin(2*x)+cos(3*x);              %periodic function for validation
X = periodspace(0,4*pi,20);         %peridic grid (on period span, even)
Xi = periodspace(0,4*pi,80);        %peridic grid (on period span, even)
F = eval(subs(f,X)).';              %periodic numerical data,must be even.
%Method_________________________________________________________________
X = X(:); Xi = Xi(:); n = numel(X); m = numel(Xi);
lx = n*(X(2)-X(1)); h = 2*pi/n;  k = 2*pi/lx;  %mapping
dX = k*bsxfun(@minus,Xi,X.');
S = sin(pi*dX/h)./tan(dX/2)/(2*pi/h);   %Periodic Sinc Function
S(isnan(S)) = 1;
Fi = S*F;
%Validation_____________________________________________________________
Fa = eval(subs(f,Xi));
e = norm(Fi-Fa,inf);                    %absolute error
%Comparison_____________________________________________________________
X2 = chebspace(X(n)-lx,X(n),n).';      %must be the same span and number
Xi2 = chebspace(X(n)-lx,X(n),m).';     %must be the same span and number
F2 = eval(subs(f,X2));                 %function numerical data
P2 = lagrange(X2,Xi2);                 %Lagrange InterpolationS
Fi2 = P2*F2;
Fa2 = eval(subs(f,Xi2));
e2 = norm(Fa2-Fi2,inf);                 %absolute error
%Illustration___________________________________________________________
XX = [X,X2]; XXi = [Xi,Xi2]; FF = [F,F2]; FFi = [Fi,Fi2]; FFa = [Fa,Fa2];
figure(1); clf
name = {'Periodic','Lagrange'}; e = [e,e2];
for i = [1,2],subplot(2,1,i)
    plot(XXi(:,i),FFa(:,i),'linestyle','-','Color',[0.8,0.8,0.8],...
        'Marker','o','MarkerFaceColor',[0.8,0.8,0.8],...
        'displayname','Exact function'); hold on
    plot(XX(:,i),FF(:,i),'linestyle','none','Color',[1 0.4 0.4],...
        'Marker','s','MarkerFaceColor',[1 0.4 0.4],...
        'displayname','Initial points');
    plot(XXi(:,i),FFi(:,i),'linestyle','-','Color','k',...
        'Marker','.','MarkerFaceColor','k',...
        'displayname',...
        [name{i} ' interpolation points, error = ' num2str(e(i))]);
    xlabel('x'); ylabel('f(x)'); axis equal; axis tight
    legend('show','location','NorthOutside');
end
