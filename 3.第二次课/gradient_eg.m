% Calculate the 2-D gradient of xe^(-x*x-y*y) on a grid.
x = -2:.2:2; y = (-1:.15:1).';
z = x .* exp(-x.^2 - y.^2);
[px,py] = gradient(z,.2,.2);
% Plot the contour lines and vectors in the same figure.
% contour(x,y,z), hold on
quiver(x,y,px,py)