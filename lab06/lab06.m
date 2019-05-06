%% Interp Spline cubica

f = @(x)sin(x);
fp = @(x)cos(x);
fs = @(x)-sin(x);

xmin = -pi/2;
xmax = pi/2;
N=10;

X = linspace(xmin,xmax,N+1);
Y = f(X);
fpa = fp(xmin);
fpb = fp(xmax);
x = linspace(xmin, xmax, 100);
[y,z,t] = SplineCubic(X,Y,x,fpa,fpb);
plot(x,y);

close all;
figure(1);
grid on;
plot(x, y, 'LineWidth', 3);
hold on;
plot(X,Y,'o');

figure(2);
fplot(fp, [xmin, xmax], 'LineWidth', 3);
hold on;
plot(x, z, 'LineWidth', 3);

figure(3);
fplot(fs, [xmin, xmax], 'LineWidth', 3);
hold on;
plot(x, t, 'LineWidth', 3);

figure(4);
plot(x, abs(z-fp(x)), 'LineWidth', 3);

figure(5);
plot(x, abs(t-fs(x)), 'LineWidth', 3);

y = spline(X,[fpa Y fpb],x);
%y = interp1(X, [fpa Y fpb], x, 'spline');
figure(1);
plot(x,y, 'g');

%% Lagrange
f = @(x)1./(1+x.*x);
xmin = -6;
xmax = 6;
N=20;

X = linspace(xmin,xmax,N);
Y = f(X);
x = linspace(xmin,xmax,100);
y = MetLagrange(X,Y,x);

figure(6);
plot(x,y);
hold on;
plot(X,f(X),'o');
plot(x,f(x));

%% Metoda Richardson
syms X;
f = 1./(1+X.*X);
fp = diff(f, X);

f = matlabFunction(f, 'vars', {X});
fp = matlabFunction(fp, 'vars', {X});

xmin = -6;
xmax = 6;
n=2;
x=linspace(xmin,xmax,100); 
h=x(2)-x(1);

figure(7);
subplot(4,2,1);
fplot(f, [xmin, xmax]);
title('f(x)');

subplot(4,2,2);
fplot(fp, [xmin, xmax]);
title('f''(x)');

% n=2
n=2;
subplot(4,2,3);
df = MetRichardson(f, x, h, n);
plot(x,df);
title('f''(x) prin MetRichardson n=2');

subplot(4,2,4);
Er = abs(df-fp(x));
plot(x,Er);
title('Eroarea');

% n=4
n=4;
subplot(4,2,5);
df = MetRichardson(f, x, h, n);
plot(x,df);
title('f''(x) prin MetRichardson n=4');

subplot(4,2,6);
Er = abs(df-fp(x));
plot(x,Er);
title('Eroarea');

% n=8
n=8;
subplot(4,2,7);
df = MetRichardson(f, x, h, n);
plot(x,df);
title('f''(x) prin MetRichardson n=8');

subplot(4,2,8);
Er = abs(df-fp(x));
plot(x,Er);
title('Eroarea');
