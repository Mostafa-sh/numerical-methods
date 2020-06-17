function Jac = jac(f,Fx,X,h)
n = numel(X);
Jac = zeros(numel(Fx),n);
for j = 1:n                             %jacobian
    Xh = X; Xh(j) = Xh(j)+h;
    Jac(:,j) = (feval(f,Xh)-Fx)/h;      %forward finite difference
end
end