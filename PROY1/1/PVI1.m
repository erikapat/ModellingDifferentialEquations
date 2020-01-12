function [dX] = PVI1(t,x)

dX = [x(2), 4*sin(5*t)-25*x(1)];

end
