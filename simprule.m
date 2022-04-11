function I = simprule(f, a, b, n, h)
% SIMPRULE Simpson's rule integration.
% I = SIMPRULE(F, A, B, N, H) returns Simpson's rule approximation for
% the integral of f(x) from x=a to x=b, using n subintervals,
% where F is a function handle. This function has been adjusted to also
% take in a value of h.


% Calculating the interval
step_interval = (b-a)./n;

% Setting step size from start to finish, using interval
arr = a:step_interval:b;

% Simpson algorithm
I = h/3.*(f(arr(1))+2.*sum(f(arr(3:2:end-2)))+4.*sum(f(arr(2:2:end)))+f(arr(end)));
end