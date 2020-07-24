% Code 2-10 | Pseudo Arc Length Method + [ using jac.m ]
clc; clear;
f = @(x) [10*x(1)+0.4*x(2)^3-5*x(2)^2-x(3)*40
    0.4*x(1)^3-3*x(1)^2+10*x(2)-x(3)*15 ];  %{x(3) = parameter}
X = [0.5; 2; -15];                      %guess for first point on the path
point = 200;                            %Number of points
s = 0.5;                                %step size
error = 1e-6;                           %tolerance
newitr = 100;                           %maximum itration of Newton
h = 0.01;                               % acobian increment
%Method_________________________________________________________________
n = numel(X);
for i = 1:newitr                    %Newton for first point
    Fx = f(X);
    Jac = jac(f,Fx,X,h);
    if norm(Fx) <= error, break; end
    X(1:n-1) = X(1:n-1)-Jac(:,1:n-1)\Fx;  %X for first point
end
[Q,~] = qr(Jac');                    %QR decomposition
Xdot  = Q(:,end);                    %Xdot for first point
XX = zeros(n,point);
for k = 1:point
    XX(:,k) = X;
    Xp = X + s*Xdot;                 %prediction step
    X = Xp;                          %Initial guess for Newton
    for i = 1:newitr                 %correction step using Newton
        Fx = f(X);
        Jac = [jac(f,Fx,X,h); Xdot.'];
        if norm(Fx) <= error, break; end
        X = X -Jac\[Fx; dot((X-Xp),Xdot)];
    end
    Xdot = Jac\[zeros(n-1,1);1];
end
%Illustration___________________________________________________________
figure(1); clf
plot(XX(3,:),XX(1,:),'linestyle','-','Color',[1 0.4 0.4],...
    'Marker','o','MarkerFaceColor',[1 0.4 0.4]); hold on
plot(XX(3,:),XX(2,:),'linestyle','-','Color','k',...
    'Marker','.','MarkerFaceColor',[1 0.4 0.4]);
xlabel('Parameter'); ylabel('x');
legend('x1','x2','location','southeast')
axis equal; axis tight
figure(2); clf
plot3(XX(3,:),XX(1,:),XX(2,:),'linestyle','-','Color','k',...
    'Marker','o','MarkerFaceColor',[1 0.4 0.4]); hold on
xlabel('Parameter'); ylabel('x1'); zlabel('x2');
grid on; axis equal; axis tight ;view([-50.5 28])
