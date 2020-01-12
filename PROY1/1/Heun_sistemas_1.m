function[x,y] = Heun_sistemas_1(f, a, b, N, yo)
%Método Heun de dos pasos
h = (b-a)/N;
x =a:h:b; %vectorfila
x = x(:); %asegurar vector columna
y = zeros(N+1, length(yo));
y(1,:) = yo;
for k = 1:N
    k1 = h*feval(f, x(k), y(k,:));
    k2 = h*feval(f, x(k+1), y(k,:) + k1);
    y(k+1,:) = y(k,:)+(k1+k2)/2;
end

end

