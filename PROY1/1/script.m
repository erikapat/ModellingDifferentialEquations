
%PROBLEMA 1.
%Este archivo continene las soluciones para los diferentes apartados del enunciado #1.

%% clean
clear all;
clc;

%% Heun (orden 2): intervalo [0,2] con 40 subintervalos
[t, x] = Heun_sistemas_1('PVI1', 0,2,40,[0, 0]);
%%plot
h(1) = figure;
plot(t,x(:,1)) %x1
hold on
plot(t, x(:,2)) %x2
hold on
plot(t, prima_2(t(:),x(:,1))) %x2' = x''
hold off  
xlabel('t')
ylabel('x')
axis square
grid
legend('x1','x2', 'x2^{prima}')
set(gca,'FontSize',20)
%savefig(h,'fig/heun1.fig')
saveas(gcf,'fig/heun1.png')
close(h)

%valores de la tabla .doc(documento de la tarea): intervalo [0,2] con 40 subintervalos
format long;
%[t, x] = Heun_sistemas_1('PVI1', 0,2,8,[0, 0]);
%x1
x(:,1)
%x1' = x2
x(:,2)
%x2' = x''
prima_2(t(:),x(:,1)) % functión pata calcular x2'

%create table
T = table(t, x(:,1), x(:,2), prima_2(t(:),x(:,1)), 'VariableNames', {'t', 'x1', 'x2', 'x2 prima'});
n_decimal = 6;
new_T = varfun(@(x) num2str(x, ['%' sprintf('.%df', n_decimal)]), T);
new_T

%orden: si no conoce la solución real
% primer resultado corresponde al método de heun, el segundo al método rk-4
[oH, oR] = ordenNumericoSistema('PVI1', 0,2, [0, 0]) 

%orden conociendo la solución real
% example of symbolic solving
syms x(t);
Dx = diff(x);
ode = diff(x,t, 2) == 4*sin(5*t)-25*x;
cond1 = x(0) == 0;
cond2 = Dx(0) == 0;
ySol(t) = dsolve(ode,cond1,cond2);
ySol

%plot 3d
[t, x] = Heun_sistemas_1('PVI1', 0,2,40,[0, 0]);
plot3(t,x(:,1), x(:,2))

%% clean
clear all;
clc;
%% RK4 (ORDEN 4)

[t, x] = RK_4_N('PVI1', 0,2,40,[0, 0]);
%%plot
h(1) = figure;
plot(t,x(:,1)) %x1
hold on
plot(t, x(:,2)) %x2
hold on
plot(t, prima_2(t(:),x(:,1))) %x2' = x''
hold off  
xlabel('t')
ylabel('x')
axis square
grid
legend('x1','x2', 'x2^{prima}')
set(gca,'FontSize',20)
saveas(gca,'fig/RK4.png')
close(h)

%valores de la tabla .doc(documento de la tarea): intervalo [0,2] con 40 subintervalos
%create table
T = table(t(:), x(:,1), x(:,2), prima_2(t(:),x(:,1)), 'VariableNames', {'t', 'x1', 'x2', 'x2 prima'});
n_decimal = 6;
new_T = varfun(@(x) num2str(x, ['%' sprintf('.%df', n_decimal)]), T);
new_T

%orden:si no conoce la solución real
% primer resultado corresponde al método de heun, el segundo al método rk-4
[oH, oR] = ordenNumericoSistema('PVI1', 0,2, [0, 0])

%plot 3d
[t, x] = RK_4_N('PVI1', 0,2,40,[0, 0]);
plot3(t,x(:,1), x(:,2))

