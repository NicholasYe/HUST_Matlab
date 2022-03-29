clc, clear all, close all

%% set up range
t0 = 0;
tfinal = 15;
p0 = [50; 50];

%% solve and plot
[t,p] = ode45(@evolutionODE,[t0 tfinal],p0);
plot(t,p)
title('Predator/Prey Populations Over Time')
xlabel('t')
ylabel('Population')
legend('Prey','Predators')

%% define func
function dpdt = evolutionODE(t,p)
a = 1;
b = 1;
c = 0.01;
d = 0.02;
dpdt = [p(1) .* (a - c*p(2));
        p(2) .* (-b + d*p(1))];
end