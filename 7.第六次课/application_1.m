clc, clear all, close all

%% variable
f = [2,3];
A = [1,2];
b = 8;
lx = [0;0];
ux = [4;5];

%% set up
x= sdpvar(2,1,'full');
Objective = -f*x;

%% constraints
Constraints = [];
Constraints = [Constraints;A*x<=b];
Constraints = [Constraints;lx<=x<=ux];

%% calculate
options = sdpsettings('solver', 'linprog');
tic;
optimize(Constraints,Objective,options)
toc;

%% Output
x = value(x);
Obj = value(Objective);
