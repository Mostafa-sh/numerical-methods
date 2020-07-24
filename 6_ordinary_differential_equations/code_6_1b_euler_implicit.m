% Code 6-1b | Euler's Implicit Method
%           | +[ using newton.m based on Code 2-8 ]
clc; clear; close all
f = @(x,Y) [Y(2); -0.1*Y(2)-x];           %ODE
Y = [0 1];                                %initial values
S = [0 2];                                %response span
h = 0.25;                                 %domain increment
er = 1e-5;                                %percision of Newton method
itr = 20;                                 %maximum iteration of Newton
d = 1e-5;                                 %Jacobina increment of Newton
%Method_________________________________________________________________
x = S(1);
Y = Y(:);
i = 1;
xx = x; YY = Y;
while x < S(2)
    i = i+1;
    x = x+h;
    Y = newton(@(Y1) Y1-Y-f(x,Y1)*h,Y,er,itr,d); %solving Implicit system
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
