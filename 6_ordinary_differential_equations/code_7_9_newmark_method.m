%% Code 7-9 | Newmark Method
clc; clear
M = diag([100,10,10]);                  %mass matrix
K = 1000*[8 -4 0; -4 8 -4; 0 -4 4];     %stiffness matrix
C = 100*[4 -2 0; -2 4 -2; 0 -2 2];      %damper
F = @(t) 50*[1;1;1]*cos(50*t);          %force
U = [0 0 0];                            %initial values
U1 = [0 0 0];                           %initial values
S = [0 4];                              %response span
h = 0.5;                                %time step size
beta = 1/6;
gamma = 1/2;
%Metod__________________________________________________________________
b1 = 1/beta/h^2; b2 = -1/beta/h;    b3 = 1-1/2/beta;
b4 = gamma*h*b1; b5 = 1+gamma*h*b2; b6 = (1+gamma*b3-gamma)*h;
tt = (S(1):h:S(2));
n = numel(tt);
m = numel(U);
U = U(:); U1 = U1(:);
U2 = M\(F(tt(1))-K*U-C*U1);
Z = zeros(m,n-1);
U = [U,Z]; U1 = [U1,Z]; U2 = [U2,Z];
K = b1*M+b4*C+K;
for i = 2:n
    B13 = b1*U(:,i-1)-b2*U1(:,i-1)-b3*U2(:,i-1);
    B46 = b4*U(:,i-1)-b5*U1(:,i-1)-b6*U2(:,i-1);
    U(:,i)  = K\(F(tt(i))+M*B13+C*B46);
    U1(:,i) = b4*U(:,i)-B46;
    U2(:,i) = b1*U(:,i)-B13;
end
%Illustration___________________________________________________________
div = ['-----------' repmat('-----------',[1,n]),'\n']; id = (1:m).';
fprintf([' t       |' repmat('%11.4g',[1,n]),'\n'],tt);       fprintf(div);
fprintf([' u%6d |'    repmat('%11.4g',[1,n]),'\n'],[id,U]');  fprintf(div);
fprintf([' du%5d |'   repmat('%11.4g',[1,n]),'\n'],[id,U1]'); fprintf(div);
fprintf([' d2u%4d |'  repmat('%11.4g',[1,n]),'\n'],[id,U2]'); fprintf(div);
