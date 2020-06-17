%% Code 4-1a | Finite Difference Method (uniform grid)
%            | +[ using fd_operator.m ]
clc; clear;
x = sym('x');                          %for validation
f = x^2*sin(x)+exp(x);                 %function for validation
n = 20;
X = linspace(-2,2,n);
F = eval(subs(f,X));                   %function numerical data
%Metod__________________________________________________________________
F = F(:);
h = X(2)-X(1);
fd = 0.5/h*[-3  4 -1];              %forward
md = 0.5/h*[-1  0  1];              %middle
bd = 0.5/h*[ 1 -4  3];              %backward
D{1} = fd_operator(fd,md,bd,n);      %first derivative Operator O(h2)
fd = 1/h^2*[ 2 -5  4 -1];
md = 1/h^2*[ 1 -2  1];
bd = 1/h^2*[-1  4 -5  2];
D{2} = fd_operator(fd,md,bd,n);      %second derivative Operator O(h2)
F1 = D{1}*F;                        %numerical differentiation
F2 = D{2}*F;
%Validation_____________________________________________________________
f1 = diff(f,1);                     %analytical differentiation
f2 = diff(f,2);
F1a = eval(subs(f1,X)).';
F2a = eval(subs(f2,X)).';
e = max(abs([F1a-F1,F2a-F2]));      %absolute error
%Illustration___________________________________________________________
figure(1); clf; subplot(2,1,1)
plot(X,F1a,'linestyle','-','Color',[1 0.4 0.4],...
    'Marker','o','MarkerFaceColor',[1 0.4 0.4],...
    'displayname','Analytical'); hold on
plot(X,F1,'linestyle','-','Color','k',...
    'Marker','.','MarkerFaceColor','k',...
    'displayname',['Numerical, error = ',num2str(e(1))]);
xlabel('x'); ylabel('df/dx');
legend('show','location','best');
subplot(2,1,2)
plot(X,F2a,'linestyle','-','Color',[1 0.4 0.4],...
    'Marker','o','MarkerFaceColor',[1 0.4 0.4],...
    'displayname','Analytical'); hold on
plot(X,F2,'linestyle','-','Color','k',...
    'Marker','.','MarkerFaceColor','k',...
    'displayname',['Numerical, error = ',num2str(e(2))]);
xlabel('x'); ylabel('d^2f / dx^2');
legend('show','location','best');
