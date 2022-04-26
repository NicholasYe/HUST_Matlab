clc, clear all, close all

%% variable
f = [5.24,7.3,8.34,4.18];
A1 = [1.5,1,2.4,1];
b1 = 2000;
A2 = [1,5,1,3.5];
b2 = 8000;
A3 = [1.5,3,3.5,1];
b3 = 5000;
lx = [0;0;0;0];

%% set up
x= sdpvar(4,1,'full');
Objective = -f*x;

%% constraints
Constraints = [];
Constraints = [Constraints;A1*x<=b1];
Constraints = [Constraints;A2*x<=b2];
Constraints = [Constraints;A3*x<=b3];
Constraints = [Constraints;lx<=x];

%% calculate
options = sdpsettings('solver', 'linprog');
tic;
optimize(Constraints,Objective,options)
toc;

%% Output
x = value(x);
Obj = value(Objective)
