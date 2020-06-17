%% Code 2-4 | Fixed-point Method
clc; clear
g = @(x) sqrt(4 + sqrt(x));               %f(x) = g(x)-x
x = 2;                                    %start point
error = 1e-5;
itr = 20;                                 %maximum itration
%Metod__________________________________________________________________
for i = 1:itr
    gx = g(x); fx = gx-x;
    Tab(i,:) = [i-1, x, fx];    %for illustration
    if norm(fx) <= error, break; end
    x = gx;
end
%Illustration___________________________________________________________
fprintf('%3s %11s %11s \n','itr','x','f(x)');
fprintf('---------------------------\n');
fprintf('%3.0f %11.5g %11.5g \n',Tab');
fprintf('---------------------------\n');
fprintf('x = %11.5g\n',x);
