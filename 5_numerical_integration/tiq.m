function S = tiq(X)
X = X(:);
n = numel(X);
X1 = [X(2:end);X(end)];
X0 = [X(1);X(1:end-1)];
R  = 1:n;
XX = bsxfun(@power,X1-X,R)-bsxfun(@power,X0-X,R); 
XX = bsxfun(@rdivide, XX, 2.^R.*factorial(R));
r = n-1;
D = gdq(X,r);                         %Differential operator using DQ
D = [eye(n); vertcat(D{1:r})] ;
S = XX(:).'*D;
end