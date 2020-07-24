% Code 5-9 | Integration using Taylor & DQ (chebyshev grid recommanded)
%          | +[ using chebspace.m & gdq.m ] (I came up with this!)
clc; clear
x = sym('x');                       %for validation
f = x/(x^2-2*x+2);                  %function for validation
n = 11;
X = chebspace(1,pi,n);              %chebyshev grid
F = eval(subs(f,X));                %function numerical data
%Method__________________________________________________________________
X = X(:);
X1 = [X(2:end);X(end)];
X0 = [X(1);X(1:end-1)];
R  = 1:n;
XX = bsxfun(@power,X1-X,R)-bsxfun(@power,X0-X,R);
XX = bsxfun(@rdivide, XX, 2.^R.*factorial(R));
r = n-1;
D = gdq(X,r);                        %Differential operator using DQ
D = [eye(n); vertcat(D{1:r})] ;
S = XX(:).'*D;
I = S*F(:);
%Illustration___________________________________________________________
fprintf('-----------------------------------\n');
fprintf('%16s %17.11g\n','Numerical I = ',I);
%Validation_____________________________________________________________
Ia = int(f,X(1),X(n));            %analytical integration (if applicable)
Ia = eval(Ia);
fprintf('%16s %17.11g\n','Analitical I = ',Ia);
fprintf('-----------------------------------\n');
