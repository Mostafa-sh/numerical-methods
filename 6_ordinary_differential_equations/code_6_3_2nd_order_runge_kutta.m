% Code 6-3 | Second Order Runge-Kutta Method
clc; clear; close all
f = @(x,Y) [Y(2); -0.1*Y(2)-x];           %ODE
Y = [0 1];                                %initial values
S = [0 2];                                %response span
h = 0.25;                                 %domain increment
type = 'Ralston';
%Method_________________________________________________________________
switch type
    case 'MEuler',   a2 = 1;   b21 = 1;   c1 = 1/2; c2 = 1/2;
    case 'Midpoint', a2 = 1/2; b21 = 1/2; c1 = 0;   c2 = 1;
    case 'Ralston',  a2 = 3/4; b21 = 3/4; c1 = 1/3; c2 = 2/3;
end
x = S(1);
Y = Y(:);
i = 1;
xx = x; YY = Y;
while x < S(2)
    i = i+1;
    K1 = f(x,Y);
    K2 = f(x+a2*h,Y+b21*K1*h);
    Y = Y+(c1*K1+c2*K2)*h;
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
