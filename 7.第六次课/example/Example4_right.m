clear,clc

% ��������

f=[0,0.1,0.2,0.3,0.8];

A=[1,2,0,1,0;
   0,0,2,2,1;
   3,1,2,0,3;];
b=[101;101;101];

lx=[0;0;0;0;0;];
%��������

x=intvar(5,1,'full');

%Ŀ��
Objective=f*x+[2.9,2.1,1.5]*(A*x-b);

%Լ��
Constraints = [];
Constraints = [Constraints;A*x>=b];

Constraints = [Constraints;lx<=x];


%���
% options = sdpsettings('solver', 'CPLEX'); 
options = sdpsettings('solver', 'intlinprog'); 
tic;
optimize(Constraints,Objective,options)
toc;

x = value(x)
Obj =value(Objective)