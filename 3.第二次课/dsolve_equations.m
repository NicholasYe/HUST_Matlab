%% set up function
clc, clear all, close all;
syms y(x)
eqn = (x*diff(y,x)+y-exp(x));

%% calculate
S = dsolve(eqn, y(1)==2*exp(1));

%% draw picture
m = -10:0.1e-2:10;
n = (exp(m)-exp(1)+(3060513257434037/562949953421312))./m;
plot(m, n, '-', LineWidth=2);






