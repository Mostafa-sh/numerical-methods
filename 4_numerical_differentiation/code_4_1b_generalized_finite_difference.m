%% Code 4-1b | Finite Difference Method General Approach (uniform grid)
%            | +[ using fd_operator.m ]
clc; clear
x = sym('x');                          %for validation
f = x^2*sin(x)+exp(x);                 %function for validation
n = 20;
X = linspace(-2,2,n);
F = eval(subs(f,X));                   %function numerical data
m = 7;                                 %odd number < numel(X)
r = 3;                                 %derivative order <= m-1
%Metod__________________________________________________________________
h = X(2)-X(1);                         %just uiform
C = (1:m).';                           %generating m*m fd operator
P = 0:m-1; 
S = diag(factorial(0:m-1).*(1/h).^P);
W = zeros(m,m,m);
for i= 1:m, W(:,:,i) = S/bsxfun(@power,C-i,P); end
W = permute(W,[3 2 1]);                %m*m FD operator upto order m-1
D = fd_operator(W(1,:,r+1),W((m+1)/2,:,r+1),W(m,:,r+1),n); %n*n FD operator
Fr = D*F(:);                           %numerical differentiation
%Validation_____________________________________________________________
fr = diff(f,r);                        %analytical differentiation
Fra = eval(subs(fr,X)).';
e = norm(Fr-Fra,inf);                  %absolute error
%Illustration___________________________________________________________
figure(1); clf
plot(X,Fra,'linestyle','-','Color',[1 0.4 0.4],...
    'Marker','o','MarkerFaceColor',[1 0.4 0.4],...
    'displayname','Analytical'); hold on
plot(X,Fr,'linestyle','-','Color','k',...
    'Marker','.','MarkerFaceColor','k',...
    'displayname',['Numerical, error = ',num2str(e)]);
xlabel('x'); ylabel(['d^' num2str(r) 'f/dx^' num2str(r)]);
legend('show','location','best');
