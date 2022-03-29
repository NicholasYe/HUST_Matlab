% Define the function
fun = @(x,y) 1./( sqrt(x + y) .* (1 + x + y).^2 );
polarfun = @(theta,r) fun(r.*cos(theta),r.*sin(theta)).*r;
% Define a function for the upper limit of r.
rmax = @(theta) 1./(sin(theta) + cos(theta));
% Integrate over the region bounded by 0≤θ≤π/2 and 0≤r≤rmax
q = integral2(polarfun,0,pi/2,0,rmax) 