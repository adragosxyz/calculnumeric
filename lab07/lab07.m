%% Metoda Trapezului sumata

f = @(x)1./(1+x.^2);
a = -6;
b = 6;
Iexact = integral(f,a,b);

I = 0;
m = 64;
x = linspace(a,b,m+1);

%Alg
h = (b-a)/m;
s = 0;
for i=2:m
    s = s + f(x(i));
end
s = s*2;

I = h * (f(a) + s + f(b)) / 2;

eps = abs(Iexact - I);
eps

%% Metoda Simpson sumata

f = @(x)1./(1+x.^2);
a = -6;
b = 6;
Iexact = integral(f,a,b);

I = 0;
m = 32;
x = linspace(a,b,2*m+1);

%Alg
h = (b-a)/(2*m);
s1 = 0;
s2 = 0;
for k=1:m
    s1 = s1 + f(x(2*k));
end
for k=1:m-1
    s2 = s2 + f(x(2*k+1));
end
s1 = 4*s1;
s2 = 2*s2;

I = h*(f(a) + s1 + s2 + f(b))/3;
eps = abs(Iexact - I);
eps

%% Metoda Romberg

f = @(x)1./(1+x.^2);
a = -6;
b = 6;
Iexact = integral(f,a,b);

I = 0;
m = 2^8;
m = floor(log2(m)) + 1;

h = b-a;
Q(1,1) = h*(f(a)+f(b))/2;
for i=2:m
    s = 0;
    for k=2:2^(i-1)
        s = s + f(a+((k-1)*h)/(2^(i-1)));
    end
    s = 2*s;
    Q(i,1) = (h*(f(a) + s + f(b)))/(2^i);
end
for i=2:m
    for j=2:i
        Q(i,j) = (4^(j-1)*Q(i,j-1) - Q(i-1,j-1))/(4^(j-1)-1);
    end
end

I = Q(m,m);
eps = abs(Iexact - I);
eps