function D = fd_operator(F,M,B,n)
f = numel(F); m = numel(M); b = numel(B);
k = 0.5*(m-1);                  %number of forward or backward rows
l = n-2*k;                      %number of middle rows
k1 = 1:k;
l1 = 1:l;
If = ones(f,1)*k1;
Im = ones(m,1)*l1;
Ib = ones(b,1)*k1;
Jf = bsxfun(@plus,(0:f-1)', k1);
Jm = bsxfun(@plus,(0:m-1)', l1);
Jb = bsxfun(@plus,(0:b-1)', k1);
F = F(:)*ones(1,k);
M = M(:)*ones(1,l);
B = B(:)*ones(1,k);
I = [If(:); Im(:)+k; Ib(:)+k+l      ];
J = [Jf(:); Jm(:);   Jb(:)+n-Jb(end)];
D = [F(:);  M(:);    B(:)           ];
D = sparse(I,J,D,n,n);
end