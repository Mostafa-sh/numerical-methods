% Code 4-4 | Differentiation in 2D (Chebyshev Grid Recommanded)
%          | +[ using chebspace.m and gdq.m based on Code 4-3 ]
clc; clear
x = sym('x'); y = sym('y');        %for validation
f = (x^2)*y + sin(x*y) + x*exp(y); %2D function for validation
n = [21 15];                       %number of nodes in [x,y] direction
X = chebspace(0,2,n(1));           %chebyshev grid
Y = chebspace(0,1,n(2));           %chebyshev grid
[XX,YY] = ndgrid(X,Y);             %2D grid
FF = eval(subs(f,{x,y},{XX,YY}));  %function numerical data
r = [3 2];                         %order of derivatives in[x,y] direction
%Method_________________________________________________________________
F = FF(:);
Dx = gdq(X,r(1));
Dy = gdq(Y,r(2));
D3x   = kron(Dy{end},Dx{3});
D2y   = kron(Dy{2},  Dx{end});
D1x2y = kron(Dy{2},  Dx{1});
F3x   = D3x*F;
F2y   = D2y*F;
F1x2y = D1x2y*F;
%Validation_____________________________________________________________
f3x   = diff(f,x,3);                %analytical differentiation
f2y   = diff(f,y,2);
f1x2y = diff(diff(f,x,1),y,2);
Fa3x   = eval(subs(f3x,{x,y},{XX,YY}));
Fa2y   = eval(subs(f2y,{x,y},{XX,YY}));
Fa1x2y = eval(subs(f1x2y,{x,y},{XX,YY}));
e = max(abs([Fa3x(:)-F3x Fa2y(:)-F2y Fa1x2y(:)-F1x2y])); %absolute error
%Illustration___________________________________________________________
figure(1); clf
mesh(XX,YY,Fa3x,'FaceColor',[0.8 0.8 0.8],'EdgeColor','k',...
    'displayname','Analytical'); hold on;
plot3(XX(:),YY(:),F3x,'Marker','o','Color',[1 0.4 0.4],...
    'MarkerFaceColor',[1 0.4 0.4],'linestyle','none',...
    'displayname',['Numerical, error = ',num2str(e(1))]);
xlabel('x'); ylabel('y');  zlabel('d^3f/dx^3');
legend('show','Location','best');  box on; axis tight
figure(2); clf
mesh (XX,YY,Fa2y,'FaceColor',[0.8 0.8 0.8],'EdgeColor','k',...
    'displayname','Analytical'); hold on;
plot3(XX(:),YY(:),F2y,'Marker','o','Color',[1 0.4 0.4],...
    'MarkerFaceColor',[1 0.4 0.4],'linestyle','none',...
    'displayname',['Numerical, error = ',num2str(e(2))]);
xlabel('x'); ylabel('y');  zlabel('d^2f/dy^2');
legend('show','Location','best'); box on; axis tight
figure(3); clf
mesh (XX,YY,Fa1x2y,'FaceColor',[0.8 0.8 0.8],'EdgeColor','k',...
    'displayname','Analytical'); hold on;
plot3(XX(:),YY(:),F1x2y,'Marker','o','Color',[1 0.4 0.4],...
    'MarkerFaceColor',[1 0.4 0.4],'linestyle','none',...
    'displayname',['Numerical, error = ',num2str(e(3))]);
xlabel('x'); ylabel('y');  zlabel('d^3f/dxy^2')
legend('show','Location','best'); box on; axis tight;
