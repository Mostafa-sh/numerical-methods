% Code 2-9 | Broyden Method
clc; clear
f = @(x) [x(1)^3+(x(1)^2)*x(2)-x(1)*x(3)+6;    %function
    exp(x(1))+exp(x(2))-x(3);
    x(2)^2-2*x(1)*x(3)-4];
X = [-1; -2; 1];                               %satrt points
error = 1e-3;
itr = 100;
%Method_________________________________________________________________
n = numel(X);
Fx0 = f(X);
Jac = zeros(n); h = 1e-5;
for j = 1:n                                    %Jacobian
    Xh = X; Xh(j) = Xh(j)+h;
    Jac(:,j) = (f(Xh)-Fx0)/h;
end
for i = 1:itr
    Tab(i,:) = [i-1,X.',Fx0.'];           %for illustration
    if norm(Fx0) <= error, break; end
    dX = -Jac\Fx0;
    X = X+dX;
    Fx = f(X);
    Jac = Jac+(Fx-Fx0-Jac*dX)/dot(dX,dX)*dX.'; %Jacobian Broyden
    Fx0 = Fx;
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
