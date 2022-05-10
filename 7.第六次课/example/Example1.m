clear,clc

% 参数输入

f=[2,3];

% A=[1,2];
% b=8;
% 
% lx=[0;0];
% % ux=[4;3];

A=[1,2;4,0;0,4];
b=[8;16;12];

lx=[0;0];


%变量定义

x=sdpvar(2,1,'full');

%目标
Objective=-f*x;

%约束
% Constraints = [];
% Constraints = [Constraints;A*x<=b];

% Constraints = [Constraints;lx<=x<=ux];


Constraints = [A*x<=b];

Constraints = [Constraints;lx<=x];

%求解
% options = sdpsettings('solver', 'cplex','verbose','2'); 
% options = sdpsettings('solver', 'lsqlin'); 
% options = sdpsettings('solver', 'LINPROG','verbose','2'); 
options = sdpsettings('solver', 'LINPROG'); 
% options.cplex.lpmethod=1;

tic;
optimize(Constraints,Objective,options)
toc;

%输出
x = value(x)
Obj =value(-Objective)

