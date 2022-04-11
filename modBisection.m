function p = modBisection(f, k, n)
%Modified Bisection method
% p = modBisection(f, k, n) returns the most recently computed midpoint
% after applying n iterations of the bisection method for solving f(x) = k.

% Setting the start and end points using the lenght of f
a=1;
b=length(f);
for i = 1:n
    p = round((a+b)/2); % Compute the midpoint value
    if abs(f(a)-k) > abs(f(b)-k)
        a = p; % Move a to the midpoint
    else
        b = p; % Move b to the midpoint
    end
end

