% Code 5-1 | Lower, Middle, and Upper Rectangle Rules
clc; clear
X = [0,   pi/6,   pi/4,   pi/3, pi/2, 2*pi/3];
F = [0, 0.5104, 0.7061, 0.8462,    1, 0.8462];
%Method_________________________________________________________________
F = F(:); X = X(:).'; n = numel(F);
S = X(2:end)-X(1:n-1);
Sl = [S 0];
Su = [0 S];
Sm = 0.5*[S(1) X(3:n)-X(1:n-2) S(n-1)];
Il = Sl*F;
Iu = Su*F;
Im = Sm*F;
%Illustration___________________________________________________________
fprintf('-----------------\n');
fprintf('%s%12.5g\n%s%12.5g\n%s%12.5g\n',...
    'Il = ',Il,'Iu = ',Iu,'Im = ',Im);
fprintf('-----------------\n');
