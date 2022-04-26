clc, clear all, close all

%% variable
f = [40,90];
A1 = [9,7];
b1 = 56;
A2 = [7,20];
b2 = 70;
lx = [0;0];

%% set up
x= intvar(2,1,'full');
Objective = -f*x;

%% constraints
Constraints = [];
Constraints = [Constraints;A1*x<=b1];
Constraints = [Constraints;A2*x<=b2];
Constraints = [Constraints;lx<=x];

%% calculate
options = sdpsettings('solver', 'intlinprog');
tic;
optimize(Constraints,Objective,options)
toc;

%% Output
x = value(x);
Obj = value(Objective)
