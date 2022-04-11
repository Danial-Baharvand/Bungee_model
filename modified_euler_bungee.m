function [t, y, v, h] = modified_euler_bungee(T, n, g, C, K, L)
% modified_euler_bungee modified Euler's method 
% for the bungee jumping model
% [t, y, v, h] = euler_bungee(T, n, g, C, K, L) performs Euler's method on
% the bungee jumping model, taking n steps from t = 0 to t = T.
% The initial conditions are y(0) = 0 and v(0) = 0.
% The inputs g, C, K and L are parameters from the model 
% (see project description).
% The outputs are the time array t, the solution arrays y and v, and the
% subinterval width h.

% Calculate subinterval width h
h = T / n;

% Create time array t
t = 0:h:T;

% Initialise solution arrays y and v
y = zeros(1,n+1);
v = zeros(1,n+1);

% Define function here to make for loop more readable
f = @(v,y) (g - C*abs(v)*v - max(0, K*(y - L)));

for j=1:(n)
    y(j+1) = y(j) + h*v(j);        % Second ODE that relates v and y
    
    k1 = h*f(v(j), y(j));               %
    k2 = h*f(v(j) + h, y(j) + k1);      % modified euler stuff
    v(j+1) = v(j) + 0.5*(k1 + k2);      %
end

end
