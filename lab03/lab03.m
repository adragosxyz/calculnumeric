%radacina = fzero(f, [a,b]) % fzero - functie implementata in matlab
%radacina = fzero(f, x0) 

clear all;
A = [0 1 1
     2 1 5
     4 2 1];
b = [3;5;1];

x = MetGaussPT(A,b);

if A*x==b
    x
end

%RezolvaLU
[L, U, w] = FactLU(A);
bp = b;
lenw = length(w);
for i=1:lenw
    bp([i w(i)]) = bp([w(i) i]);
end

L
U

y = SubsAsc(L,bp);
x = SubsDesc(U,y);
x

%% Problema 5
clear all;

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

y = SubsAsc(L,bp);
x = SubsDesc(U,y);
x

%% Folosirea lu functie din matlab
[Lm, Um, p] = lu(A);
Lm
Um
p
for i=1:size(p,1)
    for j=1:size(p,1)
        if p(i,j)==1
            wm(i) = j;
        end
    end
end
wm
for i=1:length(wm)
    bp(i) = b(wm(i));
end
y = SubsAsc(Lm,bp);
x = SubsDesc(Um,y);
x