%% code 4-2 | Differentiation Using Interpolation (works for coarse grids)
clc; clear
x = sym('x');                          %for validation
f = x^2*sin(x)+exp(x);                 %function for validation
n = 17;                                
X = linspace(-2,2,n);          
F = eval(subs(f,X));                   %function numerical data
r = 3;                                 %derivative order
%Metod__________________________________________________________________
I = 1:n-1; 
B = bsxfun(@power,X(:),[0 I]); 
P = sparse(I,I+1,I,n,n);
D = B*P^r/B;
Fr = D*F(:);
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
