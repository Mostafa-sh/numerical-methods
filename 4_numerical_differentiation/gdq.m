function D = gdq(X,r)
n = numel(X);
X = X(:);
W0 = eye(n);
dX = bsxfun(@minus,X(:),X.')+W0;
Pai = prod(dX,2);
W = bsxfun(@rdivide,Pai,Pai.')./dX;         %first order r = 1
W = W-diag(sum(W,2));
W = W-diag(sum(W,2));                       %more precision
D = cell(1,r);                              %higher order r > 1
D{1} = W;
for i = 2:r
    Wr = D{i-1};
    Wr = i*( bsxfun(@times,W,diag(Wr))-Wr./dX );
    Wr   = Wr - diag(sum(Wr,2));
    D{i} = Wr - diag(sum(Wr,2));            %more precision
end
D{r+1} = W0;
end