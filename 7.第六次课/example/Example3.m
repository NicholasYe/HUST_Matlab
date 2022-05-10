clear,clc

% ��������

f=[40,90];

A=[9,7;
   7,20;];
b=[56;70;];

lx=[0;0;];
ux=[100;100;];
%��������

x=intvar(2,1,'full');

%Ŀ��
Objective=-f*x;

%Լ��
Constraints = [];
Constraints = [Constraints;A*x<=b];
Constraints = [Constraints;lx<=x];
% Constraints = [Constraints;lx<=x<=ux];


%���
% options = sdpsettings('solver', 'cplex'); 
% options = sdpsettings('solver', 'lsqlin'); 
options = sdpsettings('solver', 'intlinprog'); 
tic;
optimize(Constraints,Objective,options)
toc;

x = value(x)
Obj =value(-Objective)