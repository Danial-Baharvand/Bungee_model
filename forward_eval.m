function y = forward_eval(X, T, x)
%FORWARD_EVAL Evaluate Newton's forward difference form of the
%interpolating polynomial
% y = FORWARD_EVAL(X, T, x) returns y = Pn(x), where Pn is the
% interpolating polynomial constructed using the abscissas X and
% forward difference table T.
[m,n] = size(T);
if m ~= n
error('T must be square.');
end
h=X(2)-X(1); % Calculating the distance between poins
s=(x-X(1))/h; % Calculating s
y = zeros(size(x)); % Initialise sum
for k = 1:n % Loop over sum index
    sk=1; % Initialising sk  
    for i = 1:k-1 % Loop over product index
        sk=sk.*(s-i+1); % Calculating the product of the numerator
    end
    sk=sk/factorial(k-1); % Deviding by the denominator
    y = y + T(k,k) * sk; % Add next term
end