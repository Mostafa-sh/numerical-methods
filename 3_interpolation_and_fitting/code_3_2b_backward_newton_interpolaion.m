%% Code 3-2b | Backward Newton Interpolaion Operator
clc; clear; close all
X = [1 1.4 1.6 1.9];                  %data points
F = [7 18.9616 28.6336 49.2271].';    %data points for function values
Xi = [1.1 1.5 1.8];                   %interpolation points
%Metod__________________________________________________________________
X = X(:); Xi = Xi(:);
n = numel(X); m = numel(Xi);
N = ones(n);  Ni = ones(m,n);
for j = n-1:-1:1
    N(j+1:n,j) = 0; J = 1:j;
    N(J,J)  = bsxfun(@times,N(J,J) ,X(J)-X(j+1));
    Ni(:,J) = bsxfun(@times,Ni(:,J),Xi-X(j+1));
end
P = Ni/N;
Fi = P*F;
%Illustration___________________________________________________________
plot(X,F,'linestyle',':','Color',[1 0.4 0.4],...
    'Marker','s','MarkerFaceColor',[1 0.4 0.4],...
    'displayname','Initial points'); hold on
plot(Xi,Fi,'linestyle','none','Color','k',...
    'Marker','o','MarkerFaceColor','k',...
    'displayname','Interpolated points');
xlabel('x'); ylabel('f(x)');
legend('show','location','best');
