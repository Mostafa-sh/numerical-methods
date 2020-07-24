% Code 2-8 | Newton Method
clc; clear
f = @(x) [x(1)^3+(x(1)^2)*x(2)-x(1)*x(3)+6;     %function
    exp(x(1))+exp(x(2))-x(3);
    x(2)^2-2*x(1)*x(3)-4];
X = [-1;-2;1];
error = 1e-6;
h = 1.e-5;                                      %jacobian increment
itr = 100;
%Method_________________________________________________________________
n = numel(X);
Jac = zeros(n);
for i = 1:itr
    Fx = f(X);
    Tab(i,:) = [i-1,X.',Fx.'];                  %for illustration
    if norm(Fx) <= error, break; end
    for j = 1:n                                 %jacobian
        Xh = X; Xh(j) = Xh(j)+h;
        Jac(:,j) = (f(Xh)-Fx)/h;            %forward finite difference
    end
    X = X-Jac\Fx;
end
%Illustration___________________________________________________________
div = ['\n---' repmat('------------',[1,2*n]), '\n'];
fprintf('itr');
fprintf('          x%d',1:n);
fprintf('       f%d(X)',1:n);
fprintf(div);
fprintf(['%3.0f',repmat('%12.5g',[1,2*n]),'\n'],Tab');
fprintf(['\b' div]);
fprintf('X = ');fprintf('[%12.5g ]\n    ',X.');fprintf('\b\b\b\b');
