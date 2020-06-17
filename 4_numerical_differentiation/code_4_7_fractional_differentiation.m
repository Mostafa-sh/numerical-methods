%% Code 4-7 | Fractional Differentiation (uniform grid)
clc; clear
n = 10;                                
X = linspace(0,2,n);                   %uniform grid
F = 5*exp(4*X);                        %function numerical data
r = 0.5;                               %fractional derivative order r<1
%Metod__________________________________________________________________
h = X(2)-X(1);
J = 1:n-1;
B = J.^(1-r)-(J-1).^(1-r);
C = [B(1), B(2:end)-B(1:end-1)];
R = [B(1), zeros(1,n-2)];
D = [zeros(1,n-1); toeplitz(C,R)];
D = h^-r/gamma(2-r)*[ [1;-B(:)], D ];
Fr = D*F(:);                           %numerical differentiation
%Validation_____________________________________________________________
Fra = 10*exp(4*X).'; %analytical differntiation (calculate based on f & r)
e = norm(Fr./Fra-1,inf);               %relative error
%Illustration___________________________________________________________
figure(1); clf
plot(X,Fra,'linestyle','-','Color',[1 0.4 0.4],...
    'Marker','o','MarkerFaceColor',[1 0.4 0.4],...
    'displayname','Analytical'); hold on
plot(X,Fr,'linestyle','-','Color','k',...
    'Marker','.','MarkerFaceColor','k',...
    'displayname',['Numerical, error = ',num2str(e)]);
xlabel('x'); ylabel(['d^{' num2str(r) '}f/dx^{' num2str(r) '}']);
legend('show','location','best');
