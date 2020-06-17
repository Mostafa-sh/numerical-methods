%% Code 2-6 | Secant Method
clc; clear
f = @(x) (1+x)*exp(-x^2)-2*atan(x^2);   %function
x = 0.5;
error = 1e-5;
itr = 20;                               %maximum itration
%Metod__________________________________________________________________
fx0 = f(x);
h= 1e-3; dfdx = (f(x+h)-fx0)/h;
for i = 1:itr
    Tab(i,:) = [i-1, x, fx0];           %for illustration
    if norm(fx0) <= error, break; end
    dx = -fx0/dfdx;
    x = x+dx;
    fx = f(x);
    dfdx = (fx-fx0)/dx;
    fx0 = fx;
end
%Illustration___________________________________________________________
fprintf('%3s %11s %11s \n','itr','x','f(x)');
fprintf('---------------------------\n');
fprintf('%3.0f %11.5g %11.5g \n',Tab');
fprintf('---------------------------\n');
fprintf('x = %11.5g\n',x);
