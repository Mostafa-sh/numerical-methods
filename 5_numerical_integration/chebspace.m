function X = chebspace(a,b,n)
if nargin == 1, n = a; a = 0; b = 1; end
X = a+(b-a)*(1-cos(((1:n)-1)*pi/(n-1)))/2;
 end
