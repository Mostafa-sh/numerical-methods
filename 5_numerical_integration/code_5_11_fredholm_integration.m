%% code 5-11 | Fredholm Integration (chebyshev grid recommanded)
%            | +[ using gdq.m & tiq.m based on Code 5-9 ]
clc; clear
x = sym('x');                       %for validation
f = x/(x^2-2*x+2);                  %function for validatoin
n = 21;
X = chebspace(1,pi,n);              %chebyshev grid
F = eval(subs(f,X));                %function numerical data
%Metod__________________________________________________________________
n = numel(X);
S = tiq(X);
D = gdq(X,2);
S = repmat(S,[n,1]); %Fredholm operator
A = diag(X)*D{2}+S;  %creating an operator for g(x)= x*d2f/dx2+int(f,1,pi)
G = A*F(:);
%Validation_____________________________________________________________
g = x*diff(f,2)+int(f,X(1),X(n)); %analytical integration (if applicable)
Ga = eval(subs(g,X)).';
e = norm(Ga-G,inf);               %absolute error
%Illustration___________________________________________________________
figure(1); clf
plot(X,Ga,'linestyle','-','Color',[1 0.4 0.4],...
    'Marker','o','MarkerFaceColor',[1 0.4 0.4],...
    'displayname','Analytical'); hold on
plot(X,G,'linestyle','-','Color','k',...
    'Marker','.','MarkerFaceColor','k',...
    'displayname',['Numerical, error = ',num2str(e)]);
xlabel('x'); ylabel('g(x)'); axis tight;
legend('show','location','best');
