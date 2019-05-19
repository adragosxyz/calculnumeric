%% Tema lab06

%% Interpolarea Spline Liniara
% <include>SplineL</include>

%% Metoda Spline Patratica
% <include>SplineP</include>

%% Interpolarea Spline Cubica
% <include>SplineCubic</include>

%% Derivarea Numerica
% <include>DerivNum</include>

%% Metoda Richardson
% <include>MetRichardson</include>

%% Metoda Richardson2
% <include>MetRichardson2</include>

%% Problema 2

f = @(x)sin(x);
xmin = -pi/2;
xmax = pi/2;
x = linspace(xmin,xmax,100);

N = [2, 4, 10];

for idx=1:3
    n = N(idx);
    X = linspace(xmin,xmax,n+1);
    Y = f(X);

    figure(1);
    subplot(3,1,idx);
    plot(x,f(x), 'LineWidth', 3);
    hold on;
    plot(x, SplineL(X, Y, x), 'g', 'LineWidth', 3);
    plot(X, f(X), 'or', 'LineWidth', 3);
    legend('sin(x)','SplineL', 'Puncte interpolare', 'Location', 'Best');
    title('Functia SplineL, n='+string(n));
end


%% Problema 4

f = @(x)sin(x);
fp = @(x)cos(x);
xmin = -pi/2;
xmax = pi/2;
x = linspace(xmin,xmax,100);
fpa = fp(xmin);

N = [2, 4, 10];
for idx=1:3
    n = N(idx);
    X = linspace(xmin,xmax,n+1);
    Y = f(X);

    figure(2);
    subplot(3,1,idx);
    plot(x,f(x), 'LineWidth', 3);
    hold on;

    [yP, zP] = SplineP(X, Y, fpa, x);
    plot(x, yP, 'g', 'LineWidth', 3);
    plot(X, f(X), 'or', 'LineWidth', 3);
    legend('sin(x)','SplineP', 'Puncte interpolare', 'Location', 'Best');
    title('Functia SplineP, n='+string(n));

    figure(3);
    subplot(3,1,idx);
    plot(x, fp(x), 'LineWidth', 3);
    hold on;
    plot(x, zP, 'g', 'LineWidth', 3);
    plot(X, fp(X), 'or', 'LineWidth', 3);
    legend('cos(x)','derivata SplineP','Puncte interpolare', 'Location', 'Best');
    title('Derivata functiei SplineP si derivata functiei f, n='+string(n));
end

%% Problema 5

f = @(x)sin(x);
fp = @(x)cos(x);
fs = @(x)-sin(x);

xmin = -pi/2;
xmax = pi/2;
x = linspace(xmin,xmax,100);
fpa = fp(xmin);
fpb = fp(xmax);

N = [2, 4, 10];
for idx=1:3
    n = N(idx);
    X = linspace(xmin,xmax,n+1);
    Y = f(X);

    figure(4);
    subplot(3,1,idx);
    plot(x,f(x), 'LineWidth', 3);
    hold on;

    [yC, zC, tC] = SplineCubic(X, Y, x, fpa, fpb);
    plot(x, yC, 'g', 'LineWidth', 3);
    plot(X, f(X), 'or', 'LineWidth', 3);
    legend('sin(x)','SplineC', 'Puncte interpolare', 'Location', 'Best');
    title('Functia SplineC, n='+string(n));

    figure(5);
    subplot(3,1,idx);
    plot(x, fp(x), 'LineWidth', 3);
    hold on;
    plot(x, zC, 'g', 'LineWidth', 3);
    plot(X, fp(X), 'or', 'LineWidth', 3);
    legend('cos(x)','derivata SplineC','Puncte interpolare', 'Location', 'Best');
    title('Derivata functiei SplineC si derivata functiei f, n='+string(n));

    figure(6);
    subplot(3,1,idx);
    plot(x, fs(x), 'LineWidth', 3);
    hold on;
    plot(x, tC, 'g', 'LineWidth', 3);
    plot(X, fs(X), 'or', 'LineWidth', 3);
    legend('-sin(x)','derivata 2 SplineC','Puncte interpolare', 'Location', 'Best');
    title('Derivata 2 a functiei SplineC si derivata 2 a functiei f, n='+string(n));
end

%% Problema 6

f = @(x)sin(x);
fp = @(x)cos(x);
a = 0;
b = pi;
m = 100;

x = linspace(a,b,m);
y = f(x);

metode = ["diferente finite progresive", "diferente finite regresive", "diferente finite centrale"];
for idx = 1:3
    metoda = metode(idx);
    dy = DerivNum(x,y,metoda);
    figure(7);
    subplot(3,1,idx);
    plot(x,fp(x), 'LineWidth', 4);
    hold on;
    plot(x(2:length(x)-1),dy(2:length(dy)), 'g', 'LineWidth', 3);
    legend('cos(x)', 'DerivNum', 'Location', 'Best');
    title(metoda);
    
    figure(8);
    subplot(3,1,idx);
    plot(x(2:length(x)-1),abs(dy(2:length(dy)) - fp(x(2:length(x)-1))), 'LineWidth', 3);
    title("Eroarea prin " + metoda);
end

%% Problema 7

f = @(x)sin(x);
fp = @(x)cos(x);
fs = @(x)-sin(x);
a = 0;
b = pi;
N = [4, 6, 10];
x=linspace(a,b,100); 
h=x(2)-x(1);

for idx = 1:3
   n = N(idx);
   
   figure(9);
   subplot(3,1,idx);
   df = MetRichardson(f, x, h, n);
   plot(x,fp(x), 'LineWidth', 5);
   hold on;
   plot(x, df, 'g', 'LineWidth', 3);
   legend('cos(x)', 'MetRichardson', 'Location', 'Best');
   title("f' MetRichardson n="+string(n));
  
   figure(10);
   subplot(3,1,idx);
   plot(x, abs(df - fp(x)), 'LineWidth', 3);
   title("Eroarea MetRichardson n="+string(n));
   
   figure(11);
   subplot(3,1,idx);
   d2f = MetRichardson2(f, x, h, n-1);
   plot(x,fs(x), 'LineWidth', 5);
   hold on;
   plot(x, d2f, 'g', 'LineWidth', 3);
   legend('-sin(x)', 'MetRichardson2', 'Location', 'Best');
   title("f'' MetRichardson2 n="+string(n));
end

