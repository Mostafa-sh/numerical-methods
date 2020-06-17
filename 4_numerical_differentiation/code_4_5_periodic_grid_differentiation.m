%% code 4-5 | Periodic Grid Method (only periodic data)
%           | +[ using periodspace.m ]
clc; clear
x = sym('x');                    %for validation
f = sin(2*x)+cos(3*x);           %periodic function for validation
n = 20;                          %2*k, must be even.
X = periodspace(0,2*pi,n);       %peridic grid (on period span)
F = eval(subs(f,X));             %periodic numerical data
r = 6;                           %maximum order of derivatives
%Metod__________________________________________________________________
lx = n*(X(2)-X(1)); h = 2*pi/n; k = 2*pi/lx; %mapping
I = 1:n-1;
C1 = [0 .5*(-1).^I.*cot(I*h/2)];
C2 = [-pi^2/(3*h^2)-1/6 .5*(-1).^(2:n)./sin(h*I/2).^2];
s = ceil(r/2);
D = cell(1,2*s); 
D{1} = k*toeplitz(C1,C1([1 n:-1:2]));
D{2} = k^2*toeplitz(C2);
for i = 2:s
    D{2*i-1} = D{i}*D{i-1};
    D{2*i}   = D{i}*D{i};  
end
F = F(:); Fr = zeros(n,r);
for i = 1:r, Fr(:,i) = D{i}*F; end    %numerical differentiation
%Validation_____________________________________________________________
fr = sym(zeros(r,1));
for i = 1:r, fr(i) = diff(f,i); end   %analytical differentiation
Fra = eval(subs(fr,X)).';
e = max(abs(Fra-Fr));                 %absolute error
%Comparison_____________________________________________________________
X2 = chebspace(X(n)-lx,X(n),n);        %must be the same span and number
F2 = eval(subs(f,X2));                 %function numerical data
D2 = gdq(X2,r);
F2 = F2(:); Fr2 = zeros(n,r);
for i = 1:r, Fr2(:,i) = D2{i}*F2; end  %numerical differentiation
Fra2 = eval(subs(fr,X2)).';
e2 = max(abs(Fra2-Fr2));               %absolute error
%Illustration___________________________________________________________
figure(1); clf
for i = 1:r
    subplot(s,2,i)
    plot(X,Fra(:,i),'linestyle','-','Color',[1 0.4 0.4],...
        'Marker','o','MarkerFaceColor',[1 0.4 0.4],...
        'displayname','Analytical'); hold on
    plot(X,Fr(:,i),'linestyle','-','Color','k',...
        'Marker','.','MarkerFaceColor','k',...
        'displayname','Numerical');
    xlabel('x'); ylabel(['d^' num2str(i) 'f/dx^' num2str(i)]); 
    axis tight; if i==1,legend('show','location','best');end
end
figure(2); clf
br = bar(log10([e.',e2.']),'grouped');
set(br(1),'FaceColor',[1 0.4 0.4],'displayname','Periodic');
set(br(2),'FaceColor',[0.8 0.8 0.8],'displayname','DQ');
xlabel('Order of derivative');
ylabel('Maximum of logarithm of absolute error in the domain');
legend('show','location','southeast')
