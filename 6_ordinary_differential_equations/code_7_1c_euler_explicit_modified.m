%% Code 7-1c | Modified Euler's Explicit Method
clc; clear; close all
f = @(x,Y) [Y(2); -0.1*Y(2)-x];           %ODE
Y = [0 1];                                %initial values
S = [0 2];                                %response span
h = 0.25;                                 %domain increment
%Metod__________________________________________________________________
x = S(1);
Y = Y(:);
i = 1;
xx = x; YY = Y;
while x < S(2)
    i = i+1;
    dY = f(x,Y);
    x = x+h;
    Y = Y+(dY+f(x,Y+dY*h))/2*h;
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
