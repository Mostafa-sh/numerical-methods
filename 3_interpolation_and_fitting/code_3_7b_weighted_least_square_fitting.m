%% Code 3-7b | Weighted Least Square fitting
clc; clear; close all
X = [2 5 6 8 9 13];       %Data points
Y = [7 8 10 11 12 14];    %Data points
m = 5;                    %number of polynomial base functions <= numel(X)
W = 1:numel(X);           %Weight of data
%Metod__________________________________________________________________
n = numel(X); X = X(:); Y = Y(:); W = W(:);
B = bsxfun(@power,X,0:m-1);
Bw = zeros(m);
for i = 1:n, Bi = B(i,:); 
    Bw = Bw+W(i)^2*bsxfun(@times,Bi,Bi.');
end
Aw = Bw\bsxfun(@times,B.',W.'.^2);
C = Aw*Y;           %coefficients of fitted function
P = B*Aw;           %fitting operator Sam Seeger
F = P*Y;
R = Y-F;
e = dot(R.*W,R.*W);
%Illustration___________________________________________________________
Tab = [(1:numel(X));X.';Y.';W.';F.';R.'];
fprintf('  n |');     fprintf('%12.5g',Tab(1,:));
fprintf(['\n-----' repmat('------------',[1,size(Tab,2)])]);
fprintf('\n  x |');   fprintf('%12.5g',Tab(2,:));
fprintf('\n  y |');   fprintf('%12.5g',Tab(3,:));
fprintf('\nw(x)|');   fprintf('%12.5g',Tab(4,:));
fprintf('\nf(x)|');   fprintf('%12.5g',Tab(5,:));
fprintf('\nr(x)|');   fprintf('%12.5g',Tab(6,:));
fprintf(['\n-----' repmat('------------',[1,size(Tab,2)]), '-\n']);
l = (X(end)-X(1))/6;
XX = linspace(X(1)-l,X(end)+l,200);
FF = bsxfun(@power,XX(:),0:m-1)*C;
plot(X,Y,'linestyle','none','Color',[1 0.4 0.4],...
    'Marker','s','MarkerFaceColor',[1 0.4 0.4],...
    'displayname','Initial points'); hold on
plot(XX,FF,'linestyle','-', 'linewidth',2,'Color',[0.8,0.8,0.8],...
    'displayname',['Fitted function, degree = ',num2str(m-1)]);
plot(X,F,'linestyle','none','Color','k',...
    'Marker','o','MarkerFaceColor','k',...
    'displayname',...
    ['Fitted points, error = ' num2str(e)]);
xlabel('x'); ylabel('f(x)'); axis tight
legend('show','location','NorthOutside');
