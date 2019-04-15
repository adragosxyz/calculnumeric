%% Tema lab04

%% Metoda Newton
% <include>Newton</include>

%% Metoda directa
% <include>MetDirecta</include>

%% Metoda directa sintaxa 2
% <include>MetDirecta2</include>

%% Metoda Lagrange
% <include>MetLagrange</include>

%% Metoda Newton interpolare
% <include>MetN</include>

%% Exercitiul 1
C1 = @(x,y)x.^2+y.^2-4;
C2 = @(x,y)(x.^2)/8-y;

figure(1);
fimplicit(C1, [-2, 2, -2 ,2]);
grid on;
axis equal;
hold on;
fimplicit(C2, [-3,3,-3,3]);

F = @(x,y)[C1(x,y);C2(x,y)];
syms x y
f1 = C1(x,y);
f2 = C2(x,y);

J = [diff(f1,x) diff(f1,y)
     diff(f2,x) diff(f2,y)];

disp 'Jacobianul este'
J

J = matlabFunction(J, 'vars', {x, y});
eps = 10^(-5);

x0 = [-2;0];
[xaprox,N] = Newton(F, J, x0, eps);
plot(xaprox(1,1),xaprox(2,1), 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);

x0 = [2;0];
[xaprox,N] = Newton(F, J, x0, eps);
plot(xaprox(1,1),xaprox(2,1), 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);

hold off;

%% Exercitiul 2
C1 = @(x,y)x.^2-10.*x+y.^2+8;
C2 = @(x,y)x.*(y.^2)+x-10.*y+8;

figure(2);
fimplicit(C1, [-5, 5, -5 ,5]);
grid on;
axis equal;
hold on;
fimplicit(C2, [-5, 5, -5, 5]);

F = @(x,y)[C1(x,y);C2(x,y)];
syms x y
f1 = C1(x,y);
f2 = C2(x,y);

J = [diff(f1,x) diff(f1,y)
     diff(f2,x) diff(f2,y)];

disp 'Jacobianul este'
J
 
J = matlabFunction(J, 'vars', {x, y});
eps = 10^(-5);

x0 = [1;1];
[xaprox,N] = Newton(F, J, x0, eps);
plot(xaprox(1,1),xaprox(2,1), 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);

x0 = [3;3];
[xaprox,N] = Newton(F, J, x0, eps);
plot(xaprox(1,1),xaprox(2,1), 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);

hold off;

%% Exercitiul 3
f = @(x)sin(x);
x = linspace(-pi/2,pi/2,5);
y = f(x);
y = y';

figure(3);
fplot(f,[-pi,pi]);
hold on;
grid on;
axis equal;

% Prin metoda directa
disp 'Prin metoda directa'
a = MetDirecta(x,y);
a
syms X;
Pn = 0;
for i=1:length(a)
    Pn = Pn + a(i)*X^(i-1);
end
Pn
Pn = matlabFunction(Pn, 'vars', {X});

disp 'Eroarea |Pn(pi/6) - f(pi/6)|='
abs(Pn(pi/6) - f(pi/6))

fplot(Pn,[-pi,pi]);

% Prin metoda Lagrange
disp 'Prin metoda Lagrange'
disp 'Eroarea |Pn(pi/6) - f(pi/6)|='
abs(MetLagrange(x,y,[pi/6]) - f(pi/6))

plot(linspace(-pi,pi,100), MetLagrange(x,y,linspace(-pi,pi,100)));


% Prin metoda Newton
disp 'Prin metoda Newton'
disp 'Eroarea |Pn(pi/6) - f(pi/6)|='
abs(MetN(x,y,[pi/6]) - f(pi/6))

plot(linspace(-pi,pi,100), MetN(x,y,linspace(-pi,pi,100)));


plot(pi/6, f(pi/6), 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
plot(x, y, 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);

hold off;

%% Exercitiul 4
f = @(x)sin(x);
n = 25;
x = linspace(-pi/2,pi/2,n);
y = f(x);
y = y';

figure(4);

disp 'Prin metoda Lagrange'
disp 'Eroarea |Pn(pi/6) - f(pi/6)|='
abs(MetLagrange(x,y,[pi/6]) - f(pi/6))

plot(linspace(-pi,pi,100), MetLagrange(x,y,linspace(-pi,pi,100)));
hold on;
grid on;
axis equal;

disp 'Prin metoda Newton'
disp 'Eroarea |Pn(pi/6) - f(pi/6)|='
abs(MetN(x,y,[pi/6]) - f(pi/6))

plot(linspace(-pi,pi,100), MetN(x,y,linspace(-pi,pi,100)));

disp 'Prin metoda directa'
disp 'Eroarea |Pn(pi/6) - f(pi/6)|='
abs(MetDirecta2(x,y,[pi/6]) - f(pi/6))

plot(linspace(-pi,pi,100), MetDirecta2(x,y,linspace(-pi,pi,100)));

plot(x, y, 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
title('Pentru n=25');
legend('Metoda Lagrange', 'Metoda Newton', 'Metoda Directa');
hold off;