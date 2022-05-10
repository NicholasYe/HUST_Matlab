clear,clc

% 参数输入

f=[5.24,7.3,8.34,4.18];

A=[1.5,1,2.4,1;
     1,5,1,3.5;
   1.5,3,3.5,1];
b=[2000;8000;5000];

lx=[0;0;0;0];

%变量定义

x=sdpvar(4,1,'full');

%目标
Objective=-f*x;

%约束
Constraints = [];
Constraints = [Constraints;A*x<=b];

Constraints = [Constraints;lx<=x];


%求解
options = sdpsettings('solver', 'linprog'); 

% options.cplex.lpmethod=1;

tic;
optimize(Constraints,Objective,options)
toc;

%输出
x = value(x)
Obj =value(-Objective)