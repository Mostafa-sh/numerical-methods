% Code 4-6 | Polar Coordinate Differentiation +[ using periodspace.m,
%          | +[using chebspace.m, gdq.m Code 4-3, periodiff.m Code 4-5]
clc; clear; close all
r = sym('r'); t = sym('t');   %for validation
f = sin(2*pi*r)*sin(t);       %function for validation
n = [30 20];                  %number of points in [r theta] (both even)
C = chebspace(-1,1,n(1));     %chebyshev grid space
T = periodspace(0,2*pi,n(2)); %priodic grid 
R = C(n(1)/2+1:end);
[RR,TT] = meshgrid(R,T);      %2D grid    
FF = eval(subs(f,{r,t},{RR,TT})); 
o = [2,3];                    %order of derivatives in [r theta] direction
%Method_________________________________________________________________
Dr = gdq(C,o(1));             %GDQ differntiation operator
Dt = periodiff(T,o(2));       %Periodic gird differntiation operator
I = n(1)/2+1:n(1);
I2 = sparse(1:n(2),[n(2)/2+1:n(2),1:n(2)/2],1); 
D = kron(Dr{o(1)}(I,I),Dt{o(2)})+...
    kron(Dr{o(1)}(I,n(1)/2:-1:1),I2*Dt{o(2)}); %2D operator
Fr = D*FF(:);                    %numerical differentiation
%Validation_____________________________________________________________
fr = diff(diff(f,r,o(1)),t,o(2));   %analytical differntiation
Fra = eval(subs(fr,{r,t},{RR,TT}));
e = max(abs(Fra(:)-Fr)/(max(Fra(:))-min(Fra(:))));  % relative error
%Illustration___________________________________________________________
[XX,YY] = pol2cart(TT,RR);
figure1 = figure('Color','w');
mesh(XX,YY,Fra,'FaceColor',[0.8 0.8 0.8],'EdgeColor','k');hold on;
plot3(XX(:),YY(:),Fr,'Marker','o','Color',[1 0.4 0.4],...
    'MarkerFaceColor',[1 0.4 0.4],'linestyle','none');
legend('Analytical',['Numerical, error = ',num2str(e)],'Location','best');
view([-140 72]); axis off;
