function [X,itr] = newton(fun,X,error,itr,h)
n = numel(X);
Jac = zeros(n);
for i = 1:itr
    Fx = feval(fun,X);
    if norm(Fx) <= error, itr = i-1; break; end
    for j = 1:n                             %jacobian
        Xh = X; Xh(j) = Xh(j)+h;
        Jac(:,j) = (feval(fun,Xh)-Fx)/h;    %forward finite difference
    end
    X = X-Jac\Fx;
end
end