clear,clc

% ��������

f=[2,3];

% A=[1,2];
% b=8;
% 
% lx=[0;0];
% % ux=[4;3];

A=[1,2;4,0;0,4];
b=[8;16;12];

lx=[0;0];


%��������

x=sdpvar(2,1,'full');

%Ŀ��
Objective=-f*x;

%Լ��
% Constraints = [];
% Constraints = [Constraints;A*x<=b];

% Constraints = [Constraints;lx<=x<=ux];


Constraints = [A*x<=b];

Constraints = [Constraints;lx<=x];

%���
% options = sdpsettings('solver', 'cplex','verbose','2'); 
% options = sdpsettings('solver', 'lsqlin'); 
% options = sdpsettings('solver', 'LINPROG','verbose','2'); 
options = sdpsettings('solver', 'LINPROG'); 
% options.cplex.lpmethod=1;

tic;
optimize(Constraints,Objective,options)
toc;

%���
x = value(x)
Obj =value(-Objective)

