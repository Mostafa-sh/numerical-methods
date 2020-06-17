function D = periodiff(X,r)
n = numel(X);
lx = n*(X(2)-X(1));  h = 2*pi/n; k = 2*pi/lx; 
I = 1:n-1;
C1 = [0 .5*(-1).^I.*cot(I*h/2)].';
C2 = [-pi^2/(3*h^2)-1/6 .5*(-1).^(2:n)./sin(h*I/2).^2];
s = ceil(r/2);
D = cell(1,2*s); 
D{1} = (k*toeplitz(C1,C1([1 n:-1:2])));
D{2} = (k^2*toeplitz(C2));
for i = 2:s
    D{2*i-1} = D{i}*D{i-1};
    D{2*i}   = D{i}*D{i};  
end
D{end+1} = speye(n);
end



