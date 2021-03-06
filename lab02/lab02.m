%% Functii

f = inline('x^2+y^2', 'x', 'y'); % functii de tip handle
g = @(x,y)x^2+y^2; % functii de tip handle
h = @(x,y)fun(x,y); % trecerea de la o functie de tip function la o functie de tip handle

disp(fun(2,3));

%% Calcul simbolic

clear all;
syms x y;
f = x^2 + 3*x^2 + 5*y + 6*y;

diff(f,x); % df/dx (x,y)
diff(f,y); % df/dy (x,y)
diff(f,x,2); % derivata de ordin 2 in raport cu x

subs(f, {x,y}, {2,3});

f2 = matlabFunction(f, 'vars', {x,y}); % transforma expresia simbolica intr-o functie
f2(4,6);

%% Tema

clear all

syms x
f = x^3 - 7*x^2 + 14*x - 6;
fp = diff(f,x);

f = matlabFunction(f, 'vars', {x});
fp = matlabFunction(fp, 'vars', {x});

vectorize(f);
vectorize(fp);

x = linspace(0,4,100);
y = f(x);

plot(x,y, '.-r', 'Linewidth', 3);

eps = 10^(-3);
x0 = 0.2;
[r1, N1] = Newton(f,fp,x0,eps);
x0 = 2;
[r2, N2] = Newton(f,fp,x0,eps);
x0 = 3.7;
[r3, N3] = Newton(f,fp,x0,eps);
hold on;
grid on;
plot(r1, f(r1), 'o', 'MarkerFaceColor', 'g', 'Markersize', 10);
plot(r2, f(r2), 'o', 'MarkerFaceColor', 'g', 'Markersize', 10);
plot(r3, f(r3), 'o', 'MarkerFaceColor', 'g', 'Markersize', 10);

A = [0 1 1
    2 1 5
    4 2 1];
b = [3; 5; 1;];
x = inv(A)*b;

A = [1 2 3
    0 4 5
    0 0 6];
b = [8;14;12];
x = SubsDesc(A,b)