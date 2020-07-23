% Code 6-8 | Adams-Bashforth Method (Implicit)
%           | +[ using runge_kutta.m based on Code 7-3,7-4 & 7-5 ]
%           | +[ using newton.m based on Code 2-8 ]
clc; clear; close all
f = @(x,Y) [Y(2); -0.1*Y(2)-x];           %ODE
Y = [0 1];                                %initial values
S = [0 2];                                %response span
h = 0.25;                                 %domain increment
r = 4;                                    %order of Runge Kutta method
n = 4;                                    %order of Adams-Bashforth method
er = 1e-5;                                %percision of Newton method
itr = 20;                                 %maximum iteration of Newton
d = 1e-5;                                 %Jacobina increment of Newton
%Metod__________________________________________________________________
[xx,YY] = runge_kutta(f,Y,S(1)+[0,(n-2)*h],h,r);
i = n-1;
switch n
    case 2
        while xx(i) < S(2)
            xx(i+1) = xx(i)+h;
            fun = @(Y1) Y1-YY(:,i)-(f(xx(i+1),Y1)+f(xx(i),YY(:,i)))*h/2;
            YY(:,i+1) = newton(fun,YY(:,i),er,itr,d); %Implicit system
            i = i+1;
        end
    case 3
        while xx(i) < S(2)
            xx(i+1) = xx(i)+h;
            fun = @(Y1) Y1-YY(:,i)-(5*f(xx(i+1),Y1)+8*f(xx(i),YY(:,i))...
                -f(xx(i-1),YY(:,i-1)))*h/12;
            YY(:,i+1) = newton(fun,YY(:,i),er,itr,d); %Implicit system
            i = i+1;
        end
    case 4
        while xx(i) < S(2)
            xx(i+1) = xx(i)+h;
            fun = @(Y1) Y1-YY(:,i)-(9*f(xx(i+1),Y1)+19*f(xx(i),YY(:,i))...
                -5*f(xx(i-1),YY(:,i-1))+f(xx(i-2),YY(:,i-2)))*h/24;
            YY(:,i+1) = newton(fun,YY(:,i),er,itr,d); % Implicit system
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
