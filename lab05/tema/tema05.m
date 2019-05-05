%% Tema lab05

%% Metoda Neville
% <include>MetNeville</include>

%% Metoda NDD
% <include>MetNDD</include>

%% Metoda Hermite (cu formule de calcul)
% <include>MetHermite</include>

%% Metoda HermiteDD
% <include>MetHermiteDD</include>


%% Exercitiul 5
f = @(x)sin(x);
fp = @(x)cos(x);
X = [-pi/2,-pi/6,pi/6,pi/2];
Y = f(X);
Z = fp(X);
x = linspace(-pi/2,pi/2,100);

%Subpunctul 1
%a)
y = MetNeville(X,Y,x);
%b)
y = MetNDD(X,Y,x);
%c)
[y,z] = MetHermite(X,Y,Z,x);

%Subpunctul 2
figure(1);
grid on;
subplot(2,2,1);
plot(x, f(x),'b','LineWidth',3);
xlim([-pi/2 pi/2]);
ylim([-1.1 1.1]);
title('sin(x)');
subplot(2,2,2);
plot(x, MetNeville(X,Y,x),'r','LineWidth',3);
xlim([-pi/2 pi/2]);
ylim([-1.1 1.1]);
title('MetNeville');
subplot(2,2,3);
plot(x, MetNDD(X,Y,x),'g','LineWidth',3);
xlim([-pi/2 pi/2]);
ylim([-1.1 1.1]);
title('MetNDD');
subplot(2,2,4);
plot(x, y,'y','LineWidth',3);
xlim([-pi/2 pi/2]);
ylim([-1.1 1.1]);
title('MetHermite');

figure(2);
grid on;
subplot(2,2,1);
plot(x, fp(x),'b','LineWidth',3);
xlim([-pi/2 pi/2]);
ylim([-0.1 1.1]);
title('cos(x)');
subplot(2,2,2);
plot(x, z,'r','LineWidth',3);
xlim([-pi/2 pi/2]);
ylim([-0.1 1.1]);
title('MetHermite z');

%Subpunctul 3
figure(3);
grid on;
plot(x, abs(f(x)-y),'g','LineWidth',3);
title('Eroarea f(x)-MetHermite');


%% Exercitiul 8
f = @(x)sin(x);
fp = @(x)cos(x);
X = [-pi/2,-pi/6,pi/6,pi/2];
Y = f(X);
Z = fp(X);
x = linspace(-pi/2,pi/2,100);

[y,z] = MetHermiteDD(X,Y,Z,x);
%Subpunctul 2
figure(4);
grid on;
subplot(2,2,1);
plot(x, f(x),'b','LineWidth',3);
xlim([-pi/2 pi/2]);
ylim([-1.1 1.1]);
title('sin(x)');
subplot(2,2,2);
plot(x, y,'r','LineWidth',3);
xlim([-pi/2 pi/2]);
ylim([-1.1 1.1]);
title('MetHermiteDD');

%Subpunctul 3
figure(5);
grid on;
subplot(2,2,1);
plot(x, fp(x),'b','LineWidth',3);
xlim([-pi/2 pi/2]);
ylim([-0.1 1.1]);
title('cos(x)');
subplot(2,2,2);
plot(x, z,'r','LineWidth',3);
xlim([-pi/2 pi/2]);
ylim([-0.1 1.1]);
title('MetHermiteDD z');

%Subpunctul 4
figure(6);
grid on;
plot(x, abs(f(x)-y),'g','LineWidth',3);
title('Eroarea f(x)-MetHermiteDD');
[y,z] = MetHermiteDD(X,Y,Z,pi/2);
1