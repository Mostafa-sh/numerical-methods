function x = periodspace(a,b,n)
if nargin==1, n=a; a=0; b=1; end
if mod(n,2) ~= 0
    error(' periodspace :: Number of grid points must be even.');
end
x = a+(b-a)*(1:n)/n;
end
