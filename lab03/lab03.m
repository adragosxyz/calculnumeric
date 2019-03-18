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

y = SubsAsc(L,bp);
x = SubsDesc(U,y);
x