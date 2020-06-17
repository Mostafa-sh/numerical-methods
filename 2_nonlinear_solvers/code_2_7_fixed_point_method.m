%% Code 2-7 | Fixed Point Method - Systems of Equations
clc; clear
g = @(x) [(20-4/3*(x(2)^2))^(1/3);         %f(x) = g(x)-x
    (26+1/4*(x(1)^2))^(1/3)];
X = [1; 1];                                %start points
error = 3e-4;
itr = 100;                                 %maximum itration
%Metod__________________________________________________________________
for i = 1:itr
    Gx = g(X); Fx = Gx-X;
    Tab(i,:) = [i-1, X.', Fx.'];           %for illustration
    if norm(Fx) <= error, break; end
    X = Gx;
end
%Illustration___________________________________________________________
n = numel(X);
div = ['\n---' repmat('------------',[1,2*n]), '\n'];
fprintf('itr');
fprintf('          x%d',1:n);
fprintf('       f%d(X)',1:n);
fprintf(div);
fprintf(['%3.0f',repmat('%12.5g',[1,2*n]),'\n'],Tab');
fprintf(['\b' div]);
fprintf('X = ');fprintf('[%12.5g ]\n    ',X.');fprintf('\b\b\b\b');
