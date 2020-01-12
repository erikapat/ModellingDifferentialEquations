
%PROBLEMA 2
%Este ejercicio tiene las soluciones para los diferentes apartados del
%enunciado #2.

%% clean
clc;  % Clears the screen
clear all;

%% RK_4: Resuelve la ecuación para el int.[0, 2] con las cond. ini. [4.5,4.5,1] y h = 0.2
[t, a] = RK_4_h('PVI4', 0,2,0.2,[4.5, 4.5, 1]);

%plot
%%plot
h(1) = figure;
plot(t(:),a(:,1)) %F
hold on
plot(t, a(:,2)) %P
hold on
plot(t, a(:,3)) %d
hold off  
xlabel('t')
ylabel('x')
axis square
grid
legend('F','P', 'd')
set(gca,'FontSize',20)
saveas(gcf,'fig/RK_4.png')
close(h)

%resultados para la tabla
format long;
[t(:), a]
%create table
T = table(t(:), a(:,1), a(:,2), a(:,3), 'VariableNames', {'t', 'F', 'P', 'd'});
n_decimal = 6;
new_T = varfun(@(x) num2str(x, ['%' sprintf('.%df', n_decimal)]), T);
new_T


%% clean
clc;  % Clears the screen
clear all;

%% RK_4: Resuelve la ecuación para el int.[0, 200] con las cond. ini. [4.5,4.5,1] y h = 0.2
[t, a] = RK_4_h('PVI4', 0,200,0.2,[4.5, 4.5, 1]);

%plot 2D
%%plot
h(1) = figure;
plot(t(:),a(:,1)) %F
hold on
plot(t, a(:,2)) %P
hold on
plot(t, a(:,3)) %d
hold off  
xlabel('t')
ylabel('x')
legend('F','P', 'd')
axis square
grid
set(gca,'FontSize',20)
saveas(gcf,'fig/RK_4_200.png')
close(h)

%resultados para la tabla
format long;
[t(:), a]

%plot 3D
h(1) = figure;
plot3(a(:,1), a(:,2), a(:,3))
saveas(gcf,'fig/RK_4_200_3D.png')
close(h)

%plot 3D more points
[t, a] = RK_4_h('PVI4', 0,200,0.02,[4.5, 4.5, 1]);
h(1) = figure;
plot3(a(:,1),a(:,2),a(:,3))
saveas(gcf,'fig/RK_4_200_3D_mm.png')
close(h)


%% otra forma de resolver (verificación) 
ff = @(t,a) [3*(-a(1) + a(2)); - a(2) + a(1)*a(3); 17-a(3) - a(1)*a(2)];
[t,a] = ode45(ff,[0 2],[4.5 4.5 1]);     % Runge-Kutta 4th/5th order ODE solver

%plot
%%plot
h(1) = figure;
plot(t(:),a(:,1)) %x1
hold on
plot(t, a(:,2)) %x2
hold on
plot(t, a(:,3)) %x2' = x''
hold off  
xlabel('t')
ylabel('x')
legend('F','P', 'd')
set(gca,'FontSize',20)
saveas(gcf,'fig/ode.png')
close(h)

plot3(a(:,1),a(:,2),a(:,3))
