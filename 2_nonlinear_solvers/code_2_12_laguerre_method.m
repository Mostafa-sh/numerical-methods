%% Code 2-12 | Laguerre's Method: Polynomial Root-Finding, (Real & Complex)
clc; clear
A = [2i,0.4,12+12i,9]; % p(x)=A(1)*x^(n-1)+A(2)*x^(n-2)+...+A(n-1)*x+A(n)
itr0 = 50;             % maximum itration
error = 1e-9;
%Metod__________________________________________________________________
A = fliplr(A);              % from A(n) ro A(1)
n = numel(A)-1;             % number of the roots
roots = zeros(n,1);         % roots   
k = 1;
Tab = zeros(n,6);           %for illustration
while n ~= 0
    x0 = rand+rand*i;       %random number for initial guess
    x = x0;  itr = itr0;
    for i = 1:itr0
        p = A(end); p1 = 0; p2 = 0;
        for j = 1:n          %recursive evaluation of p, p' and p"
            p2 = 2*p+x*p2;
            p1 = p+x*p1;
            p  = A(n+1-j)+x*p;
        end
        if abs(p) < error;  itr = i-1; break; end
        g = p1/p;
        h = g^2-p2/p;
        f = sqrt((n-1)*(n*h-g^2));
        D = [g+f,g-f]; [~,l] = max(abs(D));
        dx = n/D(l);
        x = x-dx;
    end
    if norm(imag(x)) < error; roots(k) = real(x); else, roots(k) = x; end
    Tab(k,:) = [k,real(x),imag(x),norm(p),itr,x0]; %for illustration
    B = [zeros(1,n-1),A(end)];
    for i = 1:n-1                                  %Horner's deflation
        B(n-i) = A(n-i+1)+roots(k)*B(n-i+1);
    end
    A = B; n = n-1; k = k+1;
end
%Illustration___________________________________________________________
fprintf(['%2s',repmat('%13s',[1,5]),'\n'],...
    'n','real(x)','imag(x)','p(x)','itr','x0');
div = ['--',repmat('-------------',[1,5]), '-\n'];      fprintf(div);
fprintf(['%2.0f', repmat('%13.5g',[1,5]), '\n'],Tab.'); fprintf(div);
