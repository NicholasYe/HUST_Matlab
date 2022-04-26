clc, clear all, close all

%% variable
f = [0,0.1,0.2,0.3,0.8];
A1 = [1,2,0,1,0];
b1 = 100;
A2 = [0,0,2,2,1];
b2 = 100;
A3 = [3,1,2,0,3];
b3 = 100;
lx = [0;0;0;0;0];

%% set up
x= intvar(5,1,'full');
Objective = -f*x;

%% constraints
Constraints = [];
Constraints = [Constraints;A1*x==b1];
Constraints = [Constraints;A2*x==b2];
Constraints = [Constraints;A3*x==b3];
Constraints = [Constraints;lx<=x];

%% calculate
options = sdpsettings('solver', 'intlinprog');
tic;
optimize(Constraints,Objective,options)
toc;

%% Output
x = value(x);
Obj = value(Objective)
