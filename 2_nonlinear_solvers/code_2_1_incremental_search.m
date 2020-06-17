%% Code 2-1 | Incremental Search Method
clc; clear
f = @(x) 2*x^4 - 12*x^2 + 7;         %function
x1 = 0;                              %start point
dx = 0.1;                            %search increment
%Metod__________________________________________________________________
f1 = f(x1);
x2 = x1 + dx;  f2 = f(x2);
i = 2; Tab = [x1, x2; f1, f2];       %for illustration
while f1*f2 > 0
    f1 = f2;
    x2 = x2 +dx; f2 = f(x2);
    i = i+1;  Tab(:,i) = [x2; f2];   %for illustration
end
%Illustration___________________________________________________________
fprintf('  x |');   fprintf('%9.2g',Tab(1,:));
fprintf('\nf(x)|'); fprintf('%9.2g',Tab(2,:));
fprintf(['\n-----' repmat('---------',[1,size(Tab,2)]), '-\n'])
fprintf('x is in [%9.2g%9.2g ] \n',Tab(1,i-1:i));
