%% Comanda fplot

%% Reprezentarea explicita a unei functii
R = 2;
y1 = @(x)sqrt(R^2-x.^2);
y2 = @(x)-sqrt(R^2-x.^2);

figure(1);
fplot(y1, [-R, R]);
hold on;
fplot(y2, [-R, R]);
axis equal;
grid on;

%% Reprezentarea parametrica a unei functii

x = @(t)R*cos(t);
y = @(t)R*sin(t);
figure(2);
% Pentru reprezentari parametrice folosim de asemenea comanda fplot

fplot(x,y,[0, 2*pi]);
axis equal;
grid on;

% animatie
t = linspace(0,2*pi,60);
for i = 1:length(t)
    plot(x(t(i)), y(t(i)), 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
    hold on;
    plot(x(t(1:i)), y(t(1:i)), 'LineWidth', 3);
    plot(-R,-R);
    plot(R,R);
    axis equal;
    grid on;
    M(i) = getframe;
    hold off;
end

movie(M, 3, length(t)/3);

% fplot(x, y, [tmin, tmax]);

%% Reprezentarea implicita a unei functii

figure(3);
F = @(x,y)x.^2+y.^2-R^2;
fimplicit(F, [-R, R, -R, R]);
grid on;
axis equal;

%fplot(f, [xmin, xman, ymin, ymax]);

%% Exercitiul 1

C1 = @(x,y)x.^2+y.^2-4;
C2 = @(x,y)(x.^2)/8-y;

figure(4);
fimplicit(C1, [-2, 2, -2 ,2]);
grid on;
axis equal;
hold on;
fimplicit(C2, [-3,3,-3,3]);

F = @(x,y)[x.^2+y.^2-4; (x.^2)/8-y];
syms x y
f1 = C1(x,y);
f2 = C2(x,y);
%f2 = (x.^2)/8-y

J = [diff(f1,x) diff(f1,y)
     diff(f2,x) diff(f2,y)];

J = matlabFunction(J, 'vars', {x, y});
eps = 10^(-5);

x0 = [-2;0];
[xaprox,N] = Newton(F, J, x0, eps);
plot(xaprox(1,1),xaprox(2,1), 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);

x0 = [2;0];
tic;
[xaprox,N] = Newton(F, J, x0, eps);
tex = toc;
tex
plot(xaprox(1,1),xaprox(2,1), 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);

hold off;

%% Interpolarea Lagrange

% problema 3

f = @(x)sin(x);
%x = [-pi/2, 0, pi/2];
x = linspace(-pi/2,pi/2,5);
y = f(x);
y = y';
a = MetDirecta(x,y);
a

syms X;
Pn = 0;
for i=1:length(a)
    Pn = Pn + a(i)*X^(i-1);
end
Pn
Pn = matlabFunction(Pn, 'vars', {X});
figure(5);
fplot(Pn,[-pi/2,pi/2]);
hold on;
plot(x, y, 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);