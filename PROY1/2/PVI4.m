function [f] = PVI4(t, a)
%a = [a(1) a(2) a(3)] =  [F P d]
f = [3*(-a(1) + a(2)), - a(2) + a(1)*a(3), 17-a(3) - a(1)*a(2)];

end
