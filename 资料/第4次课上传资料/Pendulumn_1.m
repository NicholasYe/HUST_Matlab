% example to demostrating Matlab/Simulink interaction 
clear all;
%% Model parameters
g=9.8;  % acceleration of gravity, 9.8 m/s^2
L=0.3;  % length of rod, m
m =0.5; % mass of the ball, kg
C_fv=0.2;  % air friction effient
t_end=15;   % s
t_Max_step= 0.001;   
%% initial conditions
omega0 =5;  % initial velocity, m/s
theta0= 30; % starting position, degrees

%% call for simulink
sim('Pendulum_3.slx');
%% results
% theta= ans.yout{1}.Values.Data(:,1);
% velocity= ans.yout{1}.Values.Data(:,2);
% time= ans.yout{1}.Values.Time(:,1);
% figure('color',[1,1,1]);
% plotyy(time,theta,time,velocity);