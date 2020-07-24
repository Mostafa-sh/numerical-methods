% Exampe 3-5 | Newton-Raphson Method
clc; clear
f = @(x) (1+x)*exp(-x^2)-2*atan(x^2);      %function
x = 0.5;                                   %start point
h = 0.001;                                 %jacobian increment
error = 1e-5;
itr = 20;                                  %maximum itration
%Method_________________________________________________________________
for i = 1:itr
    fx = f(x);
    Tab(i,:) = [i-1, x, fx];    %for illustration
    if norm(fx) <= error, break; end
    x = x-fx*h/(f(x+h)-fx);
end
%Illustration___________________________________________________________
fprintf('%3s %11s %11s \n','itr','x','f(x)');
fprintf('---------------------------\n');
fprintf('%3.0f %11.5g %11.5g \n',Tab');
fprintf('---------------------------\n');
fprintf('x = %11.5g\n',x);
