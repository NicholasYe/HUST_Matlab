fun = @(z) 1./(2*z-1);
q = integral(fun,0,0,'Waypoints',[1+1i,1-1i])