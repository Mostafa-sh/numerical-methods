% code 5-12 | Volterra Integration (chebyshev grid recommanded)
%           | +[ using tiq.m based on Code 5-9 ]
clc; clear
x = sym('x');                       %for validation
f = sin(x);                         %function for validatoin
n = 21;
X = chebspace(0,2*pi,n);            %chebyshev grid
F = eval(subs(f,X));                %function numerical data
%Method_________________________________________________________________
n = numel(X);
S = zeros(n);
for i = 2:n, J = 1:i;
    S(i,J) = tiq(X(J));   %Volterra operator
end
I = S*F(:);
%Validation_____________________________________________________________
Ia = int(f,x,X(1),x);             %analytical integration (if applicable)
Ia = eval(subs(Ia,X)).';
e = norm(Ia-I,inf);               %absolute error
%Illustration___________________________________________________________
figure(1); clf
plot(X,F,'linestyle','-','Color',[1 0.4 0.4],...
    'Marker','o','MarkerFaceColor',[1 0.4 0.4],...
    'displayname','f(x)'); hold on
plot(X,Ia,'linestyle','-','Color',[0.8  0.8 0.8],...
    'Marker','s','MarkerFaceColor',[0.8  0.8 0.8],...
    'displayname','I(x), Analytical');
plot(X,I,'linestyle','-','Color','k',...
    'Marker','.','MarkerFaceColor','k',...
    'displayname',['I(x), Numerical, error = ',num2str(e)]);
xlabel('x'); axis tight;
legend('show','location','best');
