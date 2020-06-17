function L = lagrange(X,Xi)
X = X(:); Xi = Xi(:);
dX  = bsxfun(@minus,X ,X.')+eye(numel(X));
dXi = bsxfun(@minus,Xi,X.');
L = bsxfun(@rdivide,prod(dXi,2),prod(dX,2).')./dXi; L(dXi == 0)= 1;
end