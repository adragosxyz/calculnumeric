%% Tema lab03

%% Metoda substitutiei descendente
% <include>SubsDesc</include>

%% Metoda substitutiei ascendente
% <include>SubsAsc</include>

%% Gauss fara pivotare
% <include>GaussFaraPiv</include>

%% Gauss pivotare partiala
% <include>GaussPivPart</include>

%% Gauss pivotare totala
% <include>GaussPivTot</include>

%% InvGPP
% <include>InvGPP</include>

%% Factorizarea LU
% <include>FactLU</include>

%% Factorizarea Cholesky
% <include>FactCholesky</include>

%% Factorizarea Cholesky 2
% <include>FactCholesky2</include>

%% Exercitiul 2
A = [1 2 3
     0 2 3
     0 0 6];
b = [6; 5; 6];
SubsDesc(A,b)

%% Exercitiul 3
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

%% Exercitiul 4

A = [4 2 2
    2 10 4
    2 4 6];
b = [12; 30; 10];
[invA, detA] = InvGPP(A);
x = invA*b;

invA
detA
invA*A
x

%% Exercitiul 6

A = [1 2 -1
    2 4 7
    -1 2 5];
b = [2;13;10];

[L, U, w] = FactLU(A);
bp = b;
lenw = length(w);
for i=1:lenw
    bp([i w(i)]) = bp([w(i) i]);
end

bp
y = SubsAsc(L,bp);
y
x = SubsDesc(U,y);
x

%% Exercitiul 8
A = [1 2 3
    2 5 8
    3 8 14];
b = [-5; -14; -25];
L = FactCholesky(A);
L
y = SubsAsc(L, b);
x = SubsDesc(L', y);

x

%% Exercitiul 9
A = [1 2 3
    2 5 8
    3 8 14];
b = [-5; -14; -25];
L = FactCholesky2(A);
L
y = SubsAsc(L, b);
x = SubsDesc(L', y);

x