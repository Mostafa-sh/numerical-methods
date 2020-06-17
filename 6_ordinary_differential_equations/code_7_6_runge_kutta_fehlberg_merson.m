%% Code 7-6 | Runge-Kutta Fehlberg Merson Method
clc; clear; close all
f = @(x,Y) [Y(2); -0.1*Y(2)-x];           %ODE
Y = [0 1];                                %initial values
S = [0 2];                                %response span
h = 0.25;                                 %domain increment
type = 'Merson';
%Metod__________________________________________________________________
switch type
    case 'Felberg4'
        a2 = 1/4;   b21 = 1/4;
        a3 = 3/8;   b31 = 3/32;      b32 = 9/32;
        a4 = 12/13; b41 = 1932/2197; b42 = -7200/2197; b43 = 7296/2197;
        a5 = 1;     b51 = 439/216;   b52 = -8;         b53 = 3680/513;   b54 = -845/4104;
        a6 = 1/2;   b61 = -8/27;     b62 = 2;          b63 = -3544/2565; b64 = 1859/4104; b65 = -11/40;
        c1 = 16/135; c2 = 0; c3 = 6656/12825; c4 = 28561/56430; c5 = -9/50; c6 = 2/55;
    case 'Felberg5'
        a2 = 1/4;   b21 = 1/4;
        a3 = 3/8;   b31 = 3/32;      b32 = 9/32;
        a4 = 12/13; b41 = 1932/2197; b42 = -7200/2197; b43 = 7296/2197;
        a5 = 1;     b51 = 439/216;   b52 = -8;         b53 = 3680/513;   b54 = -845/4104;
        a6 = 1/2;   b61 = -8/27;     b62 = 2;          b63 = -3544/2565; b64 = 1859/4104; b65 = -11/40;
        c1 = 25/216; c2 = 0; c3 = 1408/2565; c4 = 2197/4104; c5 = -1/5; c6 = 0;
    case 'Merson'
        a2 = 1/3; b21 = 1/3;
        a3 = 1/3; b31 = 1/6; b32 = 1/6;
        a4 = 1/2; b41 = 1/8; b42 = 0;   b43 = 3/8;
        a5 = 1;   b51 = 1/2; b52 = 0;   b53 = -3/2; b54 = 2;
        a6 = 0;   b61 = 0;   b62 = 0;   b63 = 0;    b64 = 0;   b65 = 0;
        c1 = 1/6; c2 = 0; c3 = 0; c4 = 4/6; c5 = 1/6; c6 = 0;
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
    K4 = f(x+a4*h,Y+(b41*K1+b42*K2+b43*K3)*h);
    K5 = f(x+a5*h,Y+(b51*K1+b52*K2+b53*K3+b54*K4)*h);
    K6 = f(x+a6*h,Y+(b61*K1+b62*K2+b63*K3+b64*K4+b65*K5)*h);
    Y = Y+(c1*K1+c2*K2+c3*K3+c4*K4+c5*K5+c6*K6)*h;
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
