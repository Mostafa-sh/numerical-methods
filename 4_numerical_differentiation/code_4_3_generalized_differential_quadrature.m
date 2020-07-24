% Code 4-3 |  Generalized Differential Quadrature method (GDQ) Method
%          |  (chebyshev grid recommanded) +[ using chebspace.m ]
clc; clear
x = sym('x');                          %for validation
f = x^2*sin(x)+exp(x);                 %function for validation
n = 20;
X = chebspace(-2,2,n);                 %chebyshev grid
F = eval(subs(f,X));                   %function numerical data
r = 6;                                 %upto n-1
%Method_________________________________________________________________
X = X(:);
dX = bsxfun(@minus,X,X.')+eye(n);
Pai = prod(dX,2);
W = bsxfun(@rdivide,Pai,Pai.')./dX;         %first order r = 1
W = W-diag(sum(W,2));
D = cell(1,r);                              %higher order r > 1
D{1} = W;
for i = 2:r
    Wr = D{i-1};
    Wr = i*( bsxfun(@times,W,diag(Wr))-Wr./dX );
    D{i} = Wr-diag(sum(Wr,2));    
end
F = F(:); Fr = zeros(n,r);
for i = 1:r, Fr(:,i) = D{i}*F; end    %numerical differentiation
%Validation_____________________________________________________________
fr = sym(zeros(r,1));
for i = 1:r, fr(i) = diff(f,i); end   %analytical differentiation
Fra = eval(subs(fr,X.')).';
e = max(abs(Fra-Fr));                 %absolute error
%Illustration___________________________________________________________
figure(1); clf
for i = 1:r
    subplot(ceil(r/2),2,i)
    plot(X,Fra(:,i),'linestyle','-','Color',[1 0.4 0.4],...
        'Marker','o','MarkerFaceColor',[1 0.4 0.4],...
        'displayname','Analytical'); hold on
    plot(X,Fr(:,i),'linestyle','-','Color','k',...
        'Marker','.','MarkerFaceColor','k',...
        'displayname','Numerical');
    xlabel('x'); ylabel(['d^' num2str(i) 'f/dx^' num2str(i)]);
    axis tight; if i==1,legend('show','location','best');end
end
figure(2); clf
bar(log10(e),'facecolor',[1 0.4 0.4]);
xlabel('Order of derivative');
ylabel('Maximum of logarithm of absolute error in the domain');
