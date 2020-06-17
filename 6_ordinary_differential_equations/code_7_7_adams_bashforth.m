%% Code 7-7 | Adams-Bashforth Method
%           | +[ using runge_kutta.m based on Code 7-3,7-4 & 7-5 ]
clc; clear; close all
f = @(x,Y) [Y(2); -0.1*Y(2)-x];           %ODE
Y = [0 1];                                %initial values
S = [0 2];                                %response span
h = 0.25;                                 %domain increment
r = 4;                                    %order of Runge Kutta method
n = 4;                                    %order of Adams-Bashforth method
%Metod__________________________________________________________________
[xx,YY] = runge_kutta(f,Y,S(1)+[0,(n-1)*h],h,r);
i = n;
switch n
    case 2
        while xx(i) < S(2)
            xx(i+1) = xx(i)+h;
            YY(:,i+1) = YY(:,i)+...
                (3*f(xx(i),YY(:,i))-f(xx(i-1),YY(:,i-1)))*h/2;
            i = i+1;
        end
    case 3
        while xx(i) < S(2)
            xx(i+1) = xx(i)+h;
            YY(:,i+1) = YY(:,i)+...
                (23*f(xx(i),YY(:,i))-16*f(xx(i-1),YY(:,i-1))...
                +5*f(xx(i-2),YY(:,i-2)))*h/12;
            i = i+1;
        end
    case 4
        while xx(i) < S(2)
            xx(i+1) = xx(i)+h;
            YY(:,i+1) = YY(:,i)+...
                (55*f(xx(i),YY(:,i))-59*f(xx(i-1),YY(:,i-1))...
                +37*f(xx(i-2),YY(:,i-2))-9*f(xx(i-3),YY(:,i-3)))*h/24;
            i = i+1;
        end
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
