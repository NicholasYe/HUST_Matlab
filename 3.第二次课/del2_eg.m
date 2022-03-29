% This produces 100 evenly spaced points in the range −2π≤x≤2π.
% Create a vector of cosine values in this domain.
x = linspace(-2*pi,2*pi);
% Calculate the Laplacian of U using del2. Use the domain vector x to define the 1-D coordinate of each point in U.
U = cos(x);
% Analytically, the Laplacian of this function is equal to ΔU=−cos(x).
L = 4*del2(U,x);
% Plot the results.
plot(x,U,x,L)
legend('U(x)','L(x)','Location','Best')