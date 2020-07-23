% Code 6-5 | Forth Order Runge-Kutta Method
clc; clear; close all
f = @(x,Y) [Y(2); -0.1*Y(2)-x];           %ODE
Y = [0 1];                                %initial values
S = [0 2];                                %response span
h = 0.25;                                 %domain increment
%Metod__________________________________________________________________
a2 = 1/2; b21 = 1/2;
a3 = 1/2; b31 = 0;   b32 = 1/2;
a4= 1;    b41 = 0;   b42 = 0;   b43 = 1;
c1 = 1/6; c2 = 1/3;  c3 = 1/3;  c4 = 1/6;
x = S(1);
Y = Y(:);
i = 1;
xx = x; YY = Y;
while x < S(2)
    i = i+1;
    K1 = f(x,Y);
    K2 = f(x+a2*h,Y+b21*K1*h);
    K3 = f(x+a3*h,Y+(b31*K1+b32*K2)*h);
    K4 = f(x+a4*h,Y+(b41*K1+b42*K2+b43*K3)*h);
    Y = Y+(c1*K1+c2*K2+c3*K3+c4*K4)*h;
    x = x+h;
    xx(i) = x; YY(:,i) = Y;
end
%Illustration___________________________________________________________
m = numel(Y);
div = ['---------' repmat('------------',[1,m]),'\n'];
fprintf('        x'); fprintf('       y%d(x)',1:m);    fprintf(['\n',div]);
fprintf(['%9.3g',repmat('%12.5g',[1,m]),'\n'],[xx;YY]);fprintf(div);
for i = 1:m
    subplot(m,1,i)
    plot(xx,YY(i,:),'linestyle','-','Color','k',...
        'Marker','o','MarkerFaceColor',[1 0.4 0.4],...
        'displayname','f^0(x)'); hold on
    xlabel('x'); ylabel(['y_' num2str(i) '(x)']); axis tight;
end
