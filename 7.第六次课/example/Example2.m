clear,clc

% ��������

f=[5.24,7.3,8.34,4.18];

A=[1.5,1,2.4,1;
     1,5,1,3.5;
   1.5,3,3.5,1];
b=[2000;8000;5000];

lx=[0;0;0;0];

%��������

x=sdpvar(4,1,'full');

%Ŀ��
Objective=-f*x;

%Լ��
Constraints = [];
Constraints = [Constraints;A*x<=b];

Constraints = [Constraints;lx<=x];


%���
options = sdpsettings('solver', 'linprog'); 

% options.cplex.lpmethod=1;

tic;
optimize(Constraints,Objective,options)
toc;

%���
x = value(x)
Obj =value(-Objective)