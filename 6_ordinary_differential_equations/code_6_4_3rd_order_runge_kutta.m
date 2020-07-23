% Code 6-4 | Third Order Runge-Kutta Method
clc; clear; close all
f = @(x,Y) [Y(2); -0.1*Y(2)-x];           %ODE
Y = [0 1];                                %initial values
S = [0 2];                                %response span
h = 0.25;                                 %domain increment
type = 'Classic';
%Metod__________________________________________________________________
switch type
    case 'Classic'
        a2 = 1/2; b21 = 1/2; a3 = 1 ;  b31 = -1; b32 = 2;
        c1 = 1/6; c2 = 4/6;  c3 = 1/6;
    case 'Nystrom'
        a2 = 2/3; b21 = 2/3; a3 = 2/3;  b31 = 0; b32 = 2/3;
        c1 = 2/8; c2 = 3/8;  c3 = 3/8;
    case 'Nearly Optimal'
        a2 = 1/2; b21 = 1/2; a3 = 3/4;  b31 = 0; b32 = 3/4;
        c1 = 2/9; c2 = 3/9;  c3 = 4/9;
    case 'Heun'
        a2 = 1/3; b21 = 1/3; a3 = 2/3 ; b31 = 0; b32 = 2/3;
        c1 = 1/4; c2 = 0;    c3 = 3/4;
end
x = S(1);
Y = Y(:);
i = 1;
xx = x; YY = Y;
while x < S(2)
    i = i+1;
    K1 = f(x,Y);
    K2 = f(x+a2*h,Y+b21*K1*h);
    K3 = f(x+a3*h,Y+(b31*K1+b32*K2)*h);
    Y = Y+(c1*K1+c2*K2+c3*K3)*h;
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
