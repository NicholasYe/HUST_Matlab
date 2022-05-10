clear,clc

% 参数输入

f=[40,90];

A=[9,7;
   7,20;];
b=[56;70;];

lx=[0;0;];
ux=[100;100;];
%变量定义

x=intvar(2,1,'full');

%目标
Objective=-f*x;

%约束
Constraints = [];
Constraints = [Constraints;A*x<=b];
Constraints = [Constraints;lx<=x];
% Constraints = [Constraints;lx<=x<=ux];


%求解
% options = sdpsettings('solver', 'cplex'); 
% options = sdpsettings('solver', 'lsqlin'); 
options = sdpsettings('solver', 'intlinprog'); 
tic;
optimize(Constraints,Objective,options)
toc;

x = value(x)
Obj =value(-Objective)