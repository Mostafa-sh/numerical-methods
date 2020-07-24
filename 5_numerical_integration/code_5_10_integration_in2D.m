% Code 5-10 | 2D Integration (chebyshev grid recommanded)
%           | +[ using tiq.m based on Code 5-9 ]
clc; clear
x = sym('x'); y = sym('y');        %for validation
f = (1-x^2).*sqrt(1-y.^2);         %function for validatoin
n = [17 21];                       %number of nodes in [x y] direction
X = chebspace(-2,2,n(1));          %chebyshev grid
Y = chebspace(-1,1,n(2));          %chebyshev grid
[XX,YY] = ndgrid(X,Y);             %2D grid
FF = eval(subs(f,{x,y},{XX,YY}));  %2D function numerical data
%Method_________________________________________________________________
F = FF(:);
Sx = tiq(X);
Sy = tiq(Y);
Sxx  = kron(eye(n(2)), Sx);
Syy  = kron(Sy, eye(n(1)));
Sxy  = kron(Sy, Sx);
Ix  = Sxx*F;
Iy  = Syy*F;
Ixy = Sxy*F;
%Validation_____________________________________________________________
Ixa = int(f,x,X(1),X(n(1)));     %analytical integration (if applicable)
Iya = int(f,y,Y(1),Y(n(2)));
Ixya = eval(int(Iya,x,X(1),X(n(1))));
Ixa = eval(subs(Ixa,Y)).';
Iya = eval(subs(Iya,X)).';
e = [norm(Ix-Ixa,inf),norm(Iy-Iya,inf)];   %absolute error
%Illustration___________________________________________________________
fprintf('-------------------------------------\n')
fprintf('%18s %17.11g\n','Numerical Ixy = ',Ixy);
fprintf('%18s %17.11g\n','Analitical Ixy = ',Ixya);
fprintf('-------------------------------------\n')
figure(2); clf
subplot(2,2,[1,3])
mesh(XX,YY,FF,'FaceColor','none','linewidth',2,...
    'EdgeColor',[1 0.4 0.4],'MeshStyle','row');hold on
mesh(XX,YY,FF,'FaceColor','none','linewidth',1,...
    'EdgeColor','k','MeshStyle','column');hold on
xlabel('x'); ylabel('y'); zlabel('f(x,y)');
axis equal; view([135 35]); box on
subplot(2,2,2)
plot(Y,Ixa,'linestyle','-','Color',[0.8 0.8 0.8],...
    'Marker','o','MarkerFaceColor',[0.8 0.8 0.8],...
    'displayname','Analytical'); hold on
plot(Y,Ix,'linestyle','-','Color','k',...
    'Marker','.','MarkerFaceColor','k',...
    'displayname',['Numerical, error = ',num2str(e(1))]);
xlabel('y'); ylabel('Ix = f(y)');  axis equal; 
legend('show','location','NorthOutside');
subplot(2,2,4)
plot(X,Iya,'linestyle','-','Color',[0.8 0.8 0.8],...
    'Marker','s','MarkerFaceColor',[0.8 0.8 0.8],...
    'displayname','Analytical'); hold on
plot(X,Iy,'linestyle','-','Color',[1 0.4 0.4],...
    'Marker','.','MarkerFaceColor',[1 0.4 0.4],...
    'displayname',['Numerical, error = ',num2str(e(2))]);
xlabel('x'); ylabel('Iy = f(x)');  axis equal; 
legend('show','location','NorthOutside');
