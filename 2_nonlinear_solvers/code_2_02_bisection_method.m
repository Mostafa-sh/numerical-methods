% Code 2-2 | Bisection Method
clc; clear
f = @(x) x^2-exp(-x);           %function
a = 0;                          %left  limit
b = 1;                          %right limit
error   = 1e-4;
itr = 20;                       %maximum itration
%Method_________________________________________________________________
fa = f(a); fb = f(b);
for i = 1:itr
    r  = (a+b)/2;    fr = f(r);
    Tab(i,:) = [i, a, fa, b, fb, r, fr]; %for illustration
    if i~=1 && abs(r0/r-1) <= error, break; end
    if  fa*fr < 0,    b = r;  fb = fr;
    else,             a = r;  fa = fr;
    end
    r0 = r;
end
%Illustration___________________________________________________________
fprintf(['%3s',repmat('%11s',[1,6]),'\n'],...
    'itr','a','f(a)','b','f(b)','r','f(r)');
div = ['---',repmat('-----------',[1,6]), '\n'];        fprintf(div);
fprintf(['%3.0f', repmat('%11.4g',[1,6]), '\n'],Tab.'); fprintf(div);
fprintf('x = %10.4g\n',r);
