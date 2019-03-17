%% Tema lab02

%% Metoda bisectiei
% <include>MetBisectie</include>

%% Metoda Newton-Raphson
% <include>MetNR</include>

%% Metoda secantei
% <include>MetSecantei</include>

%% Metoda pozitiei false
% <include>MetPozFalse</include>

%% SubsDesc
% <include>SubsDesc</include>

%% Gauss fara pivotare
% <include>GaussFaraPiv</include>

%% Gauss pivotare partiala
% <include>GaussPivPart</include>

%% Gauss pivotare totala
% <include>GaussPivTot</include>

%% Problema 2
clear all;
f = inline(vectorize('x^3 - 7*x^2 + 14*x - 6'), 'x');
eps = 10^(-5);
a = [0 1 3.2];
b = [1 3.2 4];
for i=1:3
    x_aprox(i) = MetBisectie(f, a(i), b(i), eps);
end
x = linspace(0,4,100);
y = f(x);
plot(x,y, 'Linewidth', 3);
hold on;
plot(x_aprox, f(x_aprox), 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
legend('x^3-7x^2+14x-6');
grid on;
hold off;

%% Problema 3
clear all;
f1 = inline(vectorize('exp(x)-2'), 'x');
f2 = inline(vectorize('cos(exp(x)-2)'), 'x');
f3 = inline(vectorize('exp(x)-2-cos(exp(x)-2)'), 'x');
a = 0.5;
b = 1.5;
x = linspace(a,b,100);
eps = 10^(-5);
x_aprox = MetBisectie(f3,a,b,eps);
plot(x, f1(x), 'Linewidth', 3);
hold on;
grid on;
plot(x, f2(x), 'Linewidth', 3);
plot(x, f3(x), 'Linewidth', 3);
plot(x_aprox, f3(x_aprox), 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
legend('e^x-2', 'cos(e^x-2)', 'e^x-2-cos(e^x-2)');
hold off;

%% Problema 4
clear all;
a = 0;
b = 3;
f1 = inline(vectorize('x-sqrt(3)'), 'x');
eps = 10^(-5);
x_aprox = MetBisectie(f1,a,b,eps);
x_aprox

%% Problema 6
clear all;
syms x;
f = x^3 - 7*x^2 + 14*x - 6;
df = diff(f,x);

f = matlabFunction(f, 'vars', {x});
df = matlabFunction(df, 'vars', {x});

a = [0 1 3.2];
b = [1 3.2 4];
eps = 10^(-5);
for i=1:3
    x_aprox(i) = MetNR(f, df, (a(i)+b(i))/2, eps);
end
x = linspace(0,4,100);
y = f(x);
plot(x,y, 'Linewidth', 3);
hold on;
plot(x_aprox, f(x_aprox), 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
legend('x^3-7x^2+14x-6');
grid on;
hold off;

%% Problema 8
clear all;
syms x;
f = inline(vectorize('x^3 - 18*x - 10'), 'x');

a = [-5 -2.5 2.5];
b = [-2.5 0 5];
eps = 10^(-5);
for i=1:3
    [x_aprox_MetSecantei(i),N_MetSecantei(i)] = MetSecantei(f,a(i),b(i),a(i)+1,b(i)-1,eps);
    [x_aprox_MetPozFalse(i),N_MetPozFalse(i)] = MetPozFalse(f,a(i),b(i),eps);
end
x = linspace(-5,5,100);
y = f(x);
plot(x,y, 'Linewidth', 3);
hold on;
plot(x_aprox_MetSecantei, f(x_aprox_MetSecantei), 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
plot(x_aprox_MetSecantei, f(x_aprox_MetSecantei), 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 5);
legend('x^3 - 18*x - 10');
grid on;
hold off;
if sum(N_MetSecantei)<sum(N_MetPozFalse)
    disp 'Metoda secantei este mai eficienta'
elseif sum(N_MetSecantei)>sum(N_MetPozFalse)
    disp 'Metoda pozitiei false este mai eficienta'
else
    disp 'Ambele metode sunt la fel de eficiente'
end

%% Problema 10
clear all;
A = [1 2 3
    0 4 5
    0 0 6];
b = [8;14;12];
x = SubsDesc(A,b)

%% Problema 11
clear all;
A1 = [0 1 1
     2 1 5
     4 2 1];
b1 = [3; 5; 1];
A2 = [0 1 -2
      1 -1 1
      1 0 -1];
b2 = [4;6;2];
 
GaussFaraPiv(A1,b1)'
GaussFaraPiv(A2,b2)

GaussPivPart(A1,b1)'
GaussPivPart(A2,b2)

GaussPivTot(A1,b1)'
GaussPivTot(A2,b2)

eps = 10^(-20);
Aeps = [eps 1
        1 1];
beps = [1;2];
GaussFaraPiv(Aeps,beps)'
GaussPivPart(Aeps,beps)'

C = 10^20;
AC = [1 C
      1 1];
bC = [C; 2];
GaussPivPart(AC,bC)'
GaussPivTot(AC,bC)'