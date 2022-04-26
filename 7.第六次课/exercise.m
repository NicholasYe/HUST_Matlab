clc, clear all, close all

%% variable
f = [0.30,0.32,0];
A1 = [1,1,0];
b1 = 100;

A2 = [0,-7/12,-1/4];
b2_min = -30;
b2_max = 30;

A3 = [0,-5/12,-3/4];
b3_min = -80;
b3_max = 80;

A4 = [0,5/12,-1/4];
b4_min = -50;
b4_max = 50;

lx = [30;150;100];
ux = [0;50;100];

%% set up
x= sdpvar(3,1,'full');
Objective = -f*x;

%% constraints
Constraints = [];
Constraints = [Constraints;A1*x==b1];
Constraints = [Constraints;b2_min<=A2*x<=b2_max];
Constraints = [Constraints;b3_min<=A3*x<=b3_max];
Constraints = [Constraints;b4_min<=A4*x<=b4_max];
Constraints = [Constraints;lx<=x<=ux];

%% calculate
options = sdpsettings('solver', 'linprog');
tic;
optimize(Constraints,Objective,options)
toc;

%% Output
x = value(x);
Obj = value(Objective);
