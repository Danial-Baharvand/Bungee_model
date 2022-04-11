function fdash = first_order_backward(f, x0, h)
%FIRST_ORDER_BACKWARD First order backward difference approximation to f'.
% fdash = first_order_backward(f, x0, h) returns (f(x0) - f(x0-1))/ h

fdash = (f(x0) - f(x0-1))/ h;

end