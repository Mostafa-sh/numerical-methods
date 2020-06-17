function [xx,YY] = runge_kutta(fun,Y0,S,h,r)
x = S(1);
Y = Y0(:);
i = 1;
xx = x; YY = Y;
kernel = ['RK',num2str(r)];
while x < S(end)
    i = i+1;
    Y = feval(kernel,fun,x,Y,h);
    x = x+h;
    xx(i) = x; YY(:,i) = Y;
end
end
function Y = RK1(fun,x,Y,h)
Y = Y+feval(fun,x,Y)*h;                 %Forward 
end
function Y = RK2(fun,x,Y,h)
a2 = 1/2; b21 = 1/2; c1 = 0; c2 = 1;    %Midpoint
K1 = feval(fun,x,Y);
K2 = feval(fun,x+a2*h,Y+b21*K1*h);
Y = Y+(c1*K1+c2*K2)*h;
end
function Y = RK3(fun,x,Y,h)
a2 = 1/2; b21 = 1/2;
a3 = 1;   b31 = -1;  b32 = 2;
c1 = 1/6; c2 = 4/6;  c3 = 1/6;          %Classic
K1 = feval(fun,x,Y);
K2 = feval(fun,x+a2*h,Y+b21*K1*h);
K3 = feval(fun,x+a3*h,Y+(b31*K1+b32*K2)*h);
Y = Y+(c1*K1+c2*K2+c3*K3)*h;
end
function Y = RK4(fun,x,Y,h)
a2 = 1/2; b21 = 1/2;
a3 = 1/2; b31 = 0;   b32 = 1/2;
a4= 1;    b41 = 0;   b42 = 0;   b43 = 1;
c1 = 1/6; c2 = 1/3;  c3 = 1/3;  c4 = 1/6;
K1 = feval(fun,x,Y);
K2 = feval(fun,x+a2*h,Y+b21*K1*h);
K3 = feval(fun,x+a3*h,Y+(b31*K1+b32*K2)*h);
K4 = feval(fun,x+a4*h,Y+(b41*K1+b42*K2+b43*K3)*h);
Y = Y+(c1*K1+c2*K2+c3*K3+c4*K4)*h;
end