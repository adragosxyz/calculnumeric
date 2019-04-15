%% Laborator 05

% f(x) = 1/(1+x^2)
% x = [-6, 6]

f = @(x)1./(1+x.^2);
n = 15;
x = linspace(-6,6,n);
y = f(x);
y = y';

plot(linspace(-6, 6,100), MetLagrange(x,y,linspace(-6, 6, 100)));
hold on;
grid on;
axis equal;

%plot(linspace(-6, 6,100), MetN(x,y,linspace(-6, 6, 100)));
%plot(linspace(-6, 6,100), MetDirecta2(x,y,linspace(-6, 6, 100)));

plot(x, y, 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);

hold off;

%% Interpolarea Hermite cu formule de calcul
clear all;

% Date de intrare
f = @(x)sin(x);
fp = @(x)cos(x);
xmin = -pi/2;
xmax = pi/2;
N = 5;
X = linspace(xmin, xmax, N);
Y = f(X);
Y = Y';
Z = fp(X);
Z = Z';

% Apelam metoda Hermite
x = linspace(xmin,xmax,100);
[y, z] = Hermite(X,Y,Z, x);

% Reprezentam grafic
figure(1);
plot(x,y);
hold on;
plot(X, Y, 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
hold off;

figure(2);
plot(X, Z, 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);

%% Problema automobil
clear all;

T = [0, 3, 5, 8, 13];
D = [0; 225; 383; 623; 993];
V1 = [75; 77; 80; 74; 72];
V2 = [75; 65; 50; 72; 80];

x = linspace(0,13,100);
[y1, z1] = Hermite(T,D,V1, x);
[y2, z2] = Hermite(T,D,V2, x);

% Reprezentam grafic

d = [y1, y2];
for i=1:length(x)
    plot(y1(i), 0, 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
    hold on;
    grid on;
    plot(y2(i), 0, 'o', 'MarkerFaceColor', 'b', 'MarkerSize', 10);
    %plot(T, D, 'o', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
    plot(min(d)-0.1, -0.1, max(d)+0.1, 0.1);
    l = legend('Masina 1', 'Masina 2');
    l.Location = 'southwest';
    hold off;
    M(i) = getframe;
end

movie(M, 3, length(x)/3);
