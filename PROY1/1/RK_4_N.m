
% Runge Kutta Method 4th Order

function [x, y] = RK_4_N(f,a,b,N,y0)

h = (b-a)/N;
x = a:h:b;

y = zeros(N+1, length(y0));
y(1,:) =  y0;

for i=1:(length(x)-1)
    k1 = feval(f, x(i),y(i,:));
    k2 = feval(f, x(i)+0.5*h,y(i,:)+0.5*h*k1);
    k3 = feval(f, (x(i)+0.5*h),(y(i,:)+0.5*h*k2));
    k4 = feval(f, (x(i) + h),(y(i,:)+k3*h));

    y(i+1,:) = y(i,:) + (1/6)*(k1 + 2*k2 + 2*k3 + k4)*h;
end
end


